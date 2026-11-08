#!/bin/bash
# Hxreborn Patches build (Duolingo, Proton Mail, Proton VPN)
source ./src/build/utils.sh

hxreborn_dl() {
	[ -f morphe-desktop-*.jar ] || dl_gh "morphe-desktop" "MorpheApp" "latest"
	[ -f patches-*.mpp ] || dl_gh "morphe-patches" "hxreborn" "latest"
}

# 1: Duolingo (Universal / All-Architecture for Android 10+)
1() {
	hxreborn_dl
	get_patches_key "duolingo-morphe"
	near_version="1"
	get_apk "com.duolingo" "duolingo" "bundle" "universal" "120-640dpi" "Android 10+"
	patch "duolingo" "hxreborn" "duolingo-universal-hxreborn"
}

# 2: Proton Mail (Universal / All-Architecture)
2() {
	hxreborn_dl
	get_patches_key "protonmail-morphe"
	near_version="1"
	get_apk "ch.protonmail.android" "protonmail" "apk"
	patch "protonmail" "hxreborn" "protonmail-universal-hxreborn"
}

# 3: Proton VPN (Universal / All-Architecture)
3() {
	hxreborn_dl
	get_patches_key "protonvpn-morphe"
	near_version="1"
	get_apk "ch.protonvpn.android" "protonvpn" "bundle" "universal"
	patch "protonvpn" "hxreborn" "protonvpn-universal-hxreborn"
}

case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    3)
        3
        ;;
    *)
        1
        2
        3
        ;;
esac
