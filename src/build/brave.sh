#!/bin/bash
# Brave Browser & Brave Beta build (dh6k patches)
source ./src/build/utils.sh

brave_dl() {
	dl_gh "morphe-patches" "dh6k" "latest"
	dl_gh "morphe-desktop" "MorpheApp" "latest"
}

# 1: Brave Browser Stable (arm64-v8a & armeabi-v7a)
1() {
	brave_dl
	# Arm64-v8a
	get_patches_key "brave-browser-morphe"
	get_apk "com.brave.browser" "brave-browser-arm64-v8a" "bundle" "arm64-v8a"
	patch "brave-browser-arm64-v8a" "brave" "brave-browser-stable-arm64-v8a-dh6k"

	# Armeabi-v7a
	get_patches_key "brave-browser-morphe"
	get_apk "com.brave.browser" "brave-browser-armeabi-v7a" "bundle" "armeabi-v7a"
	patch "brave-browser-armeabi-v7a" "brave" "brave-browser-stable-armeabi-v7a-dh6k"
}

# 2: Brave Browser Beta (arm64-v8a & armeabi-v7a)
2() {
	brave_dl
	# Arm64-v8a
	get_patches_key "brave-beta-morphe"
	get_apk "com.brave.browser_beta" "brave-beta-arm64-v8a" "bundle" "arm64-v8a"
	patch "brave-beta-arm64-v8a" "brave" "brave-browser-beta-arm64-v8a-dh6k"

	# Armeabi-v7a
	get_patches_key "brave-beta-morphe"
	get_apk "com.brave.browser_beta" "brave-beta-armeabi-v7a" "bundle" "armeabi-v7a"
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
