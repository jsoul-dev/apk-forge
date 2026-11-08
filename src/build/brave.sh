#!/bin/bash
# Brave Browser & Brave Beta build (dh6k patches)
source ./src/build/utils.sh

brave_dl() {
	dl_gh "morphe-patches" "dh6k" "latest"
	dl_gh "morphe-desktop" "MorpheApp" "latest"
}

# Download official Brave standalone APK directly from brave/brave-browser releases
dl_brave_apk() {
	local channel=$1 # "beta" or "release"
	local arch=$2    # "arm64-v8a" or "armeabi-v7a"
	local out_name=$3

	local prefix="Beta"
	[[ "$channel" == "release" ]] && prefix="Release"

	local auth_header=()
	[[ -n "$GITHUB_TOKEN" ]] && auth_header=(--header "Authorization: Bearer $GITHUB_TOKEN")

	green_log "[+] Fetching latest Brave $prefix from brave/brave-browser..."
	local rel_json
	if [[ "$channel" == "release" ]]; then
		rel_json=$(wget -qO- "${auth_header[@]}" "https://api.github.com/repos/brave/brave-browser/releases/latest")
	else
		rel_json=$(wget -qO- "${auth_header[@]}" "https://api.github.com/repos/brave/brave-browser/releases?per_page=50" | \
			jq --arg prefix "$prefix" 'first(.[] | select(.name | startswith($prefix)))')
	fi

	local tag
	tag=$(echo "$rel_json" | jq -r '.tag_name // empty')
	if [[ -z "$tag" ]]; then
		yellow_log "[!] Could not find Brave $prefix release on GitHub, will fallback to APKMirror"
		return 1
	fi

	local asset_pattern
	if [[ "$arch" == "arm64-v8a" ]]; then
		asset_pattern="^Bravearm64Universal\.apk$"
	elif [[ "$arch" == "armeabi-v7a" ]]; then
		asset_pattern="^BraveMonoarm\.apk$"
	else
		asset_pattern="^Brave.*\.apk$"
	fi

	local download_url
	download_url=$(echo "$rel_json" | jq -r --arg pat "$asset_pattern" '
		first(.assets[] | select(.name | test($pat)) | .browser_download_url)
	')

	if [[ -z "$download_url" || "$download_url" == "null" ]]; then
		if [[ "$arch" == "arm64-v8a" ]]; then
			download_url=$(echo "$rel_json" | jq -r 'first(.assets[] | select(.name | test("^BraveMonoarm64\\.apk$")) | .browser_download_url)')
		fi
	fi

	if [[ -z "$download_url" || "$download_url" == "null" ]]; then
		yellow_log "[!] Asset matching $asset_pattern not found in Brave $prefix $tag, will fallback to APKMirror"
		return 1
	fi

	mkdir -p "./download"
	green_log "[+] Downloading Brave $prefix $tag ($arch) from: $download_url"
	wget -q --show-progress -O "./download/$out_name.apk" "$download_url"
	if [[ ! -s "./download/$out_name.apk" ]]; then
		red_log "[-] Failed to download $out_name.apk"
		rm -f "./download/$out_name.apk"
		return 1
	fi
	green_log "[+] Successfully downloaded $out_name.apk"
}

# 1: Brave Browser Stable (arm64-v8a & armeabi-v7a)
1() {
	brave_dl
	# Arm64-v8a
	get_patches_key "brave-browser-morphe"
	if ! dl_brave_apk "release" "arm64-v8a" "brave-browser-arm64-v8a"; then
		get_apk "com.brave.browser" "brave-browser-arm64-v8a" "bundle" "arm64-v8a"
	fi
	patch "brave-browser-arm64-v8a" "brave" "brave-browser-stable-arm64-v8a-dh6k"

	# Armeabi-v7a
	get_patches_key "brave-browser-morphe"
	if ! dl_brave_apk "release" "armeabi-v7a" "brave-browser-armeabi-v7a"; then
		get_apk "com.brave.browser" "brave-browser-armeabi-v7a" "bundle" "armeabi-v7a"
	fi
	patch "brave-browser-armeabi-v7a" "brave" "brave-browser-stable-armeabi-v7a-dh6k"
}

# 2: Brave Browser Beta (arm64-v8a & armeabi-v7a)
2() {
	brave_dl
	# Arm64-v8a
	get_patches_key "brave-beta-morphe"
	if ! dl_brave_apk "beta" "arm64-v8a" "brave-beta-arm64-v8a"; then
		get_apk "com.brave.browser_beta" "brave-beta-arm64-v8a" "bundle" "arm64-v8a"
	fi
	patch "brave-beta-arm64-v8a" "brave" "brave-browser-beta-arm64-v8a-dh6k"

	# Armeabi-v7a
	get_patches_key "brave-beta-morphe"
	if ! dl_brave_apk "beta" "armeabi-v7a" "brave-beta-armeabi-v7a"; then
		get_apk "com.brave.browser_beta" "brave-beta-armeabi-v7a" "bundle" "armeabi-v7a"
	fi
	patch "brave-beta-armeabi-v7a" "brave" "brave-browser-beta-armeabi-v7a-dh6k"
}

case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    *)
        1
        2
        ;;
esac
