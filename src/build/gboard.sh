#!/bin/bash
# Gboard build (jasonwu1994 Gboard-patches)
source ./src/build/utils.sh

gboard_dl() {
	dl_gh "morphe-desktop" "MorpheApp" "latest"
	dl_gh "Gboard-patches" "jasonwu1994" "latest"
}

1() {
	gboard_dl
	get_patches_key "gboard-morphe"
	near_version="1"
	get_apk "com.google.android.inputmethod.latin" "gboard" "bundle" "arm64-v8a"
	patch "gboard" "gboard" "gboard-arm64-v8a-jasonwu1994"
}

1
