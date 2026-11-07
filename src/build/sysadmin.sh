#!/bin/bash
# SysAdminDoc Suite build (Facebook, Messenger, Instagram, TikTok)
source ./src/build/utils.sh

desktop_dl() {
	[ -f morphe-desktop-*.jar ] || dl_gh "morphe-desktop" "MorpheApp" "latest"
}

# 1: Facebook (Hushfacebook)
1() {
	desktop_dl
	rm -f *.mpp
	dl_gh "Hushfacebook" "SysAdminDoc" "latest"
	get_patches_key "facebook-hushfacebook"
	get_apk "com.facebook.katana" "facebook-arm64-v8a" "bundle" "arm64-v8a" "480dpi" "Android 11+"
	patch "facebook-arm64-v8a" "hushfacebook"
}

# 2: Messenger (HushMessenger)
2() {
	desktop_dl
	rm -f *.mpp
	dl_gh "HushMessenger" "SysAdminDoc" "latest"
	get_patches_key "messenger-hushmessenger"
	get_apk "com.facebook.orca" "messenger-arm64-v8a" "apk" "arm64-v8a" "nodpi" "Android 9.0+"
	patch "messenger-arm64-v8a" "hushmessenger"
}

# 3: Instagram (HushGram)
3() {
	desktop_dl
	rm -f *.mpp
	dl_gh "HushGram" "SysAdminDoc" "latest"
	get_patches_key "instagram-hushgram"
	get_apk "com.instagram.android" "instagram-arm64-v8a" "bundle" "arm64-v8a" "120-640dpi" "Android 9.0+"
	patch "instagram-arm64-v8a" "hushgram"
}

# 4: TikTok (hushfeed)
4() {
	desktop_dl
	rm -f *.mpp
	dl_gh "hushfeed" "SysAdminDoc" "latest"
	get_patches_key "tiktok-hushfeed"
	get_apk "com.zhiliaoapp.musically" "tiktok" "apk" "arm64-v8a + armeabi-v7a" "nodpi"
	patch "tiktok" "hushfeed"
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
    4)
        4
        ;;
    *)
        1
        2
        3
        4
        ;;
esac
