#!/bin/bash
# Morphe build (YouTube & YouTube Music)
source ./src/build/utils.sh

morphe_dl() {
	dl_gh "morphe-patches" "MorpheApp" "latest"
	dl_gh "morphe-desktop" "MorpheApp" "latest"
}

# 1: Patch YouTube (Universal / All-Architecture)
1() {
	morphe_dl
	get_patches_key "youtube-morphe"
	get_apk "com.google.android.youtube" "youtube" "apk"
	patch "youtube" "morphe"
}

# 2: Patch YouTube Music (arm64-v8a)
2() {
	morphe_dl
	get_patches_key "youtube-music-morphe"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-arm64-v8a" "apk" "arm64-v8a"
	patch "youtube-music-arm64-v8a" "morphe"
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
