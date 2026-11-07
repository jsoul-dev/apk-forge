#!/bin/bash

# Check new patch:
get_date() {
	local auth_header=()
	[[ -n "$GITHUB_TOKEN" ]] && auth_header=(--header "Authorization: Bearer $GITHUB_TOKEN")
	json=$(wget -qO- "${auth_header[@]}" "https://api.github.com/repos/$1/releases")
	case "$2" in
		latest)
			updated_at=$(echo "$json" | jq -r 'first(.[] | select(.prerelease == false) | .assets[] | select(.name | test("'$3'")) | .updated_at)')
			;;
		prerelease)
			updated_at=$(echo "$json" | jq -r 'first(.[] | select(.prerelease == true) | .assets[] | select(.name | test("'$3'")) | .updated_at)')
			;;
		*)
			updated_at=$(echo "$json" | jq -r 'first(.[] | select(.tag_name == "'$2'") | .assets[] | select(.name | test("'$3'")) | .updated_at)')
			;;
	esac
	echo "$updated_at"
}

checker(){
	local date1 date2 date1_sec date2_sec repo=$1 ur_repo=$repository check=$3
	date1=$(get_date "$repo" "$2" "^(.*\\\.jar|.*\\\.rvp|.*\\\.mpp|.*app-release\\\.apk)$")
	date2=$(get_date "$ur_repo" "all" "$check")
	[[ "$date1" == "null" ]] && date1=""
	[[ "$date2" == "null" ]] && date2=""

	if [ -z "$date1" ]; then
		echo "new_patch=0" >> $GITHUB_OUTPUT
		echo -e "\e[33mWarning: Could not fetch release date for $repo. Skipping.\e[0m"
		return 0
	fi

	date1_sec=$(date -d "$date1" +%s 2>/dev/null || echo 0)
	date2_sec=$(date -d "$date2" +%s 2>/dev/null || echo 0)

	if [ -z "$date2" ] || [ "$date1_sec" -gt "$date2_sec" ]; then
		echo "new_patch=1" >> $GITHUB_OUTPUT
		echo -e "\e[32mNew patch detected ($repo), building $check...\e[0m"
	else
		echo "new_patch=0" >> $GITHUB_OUTPUT
		echo -e "\e[32mUp to date ($check), skipping build.\e[0m"
	fi
}
checker "$1" "$2" "$3"
