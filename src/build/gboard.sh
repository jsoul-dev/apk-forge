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
	get_apk "com.google.android.inputmethod.latin" "gboard" "bundle" "universal"
	patch "gboard" "gboard"
}

1
