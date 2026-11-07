#!/bin/bash
# Twitter / X build (Piko NewX)
source ./src/build/utils.sh

piko_dl() {
	dl_gh "morphe-desktop" "MorpheApp" "latest"
	dl_gh "piko-newx" "crimera" "latest"
}

1() {
	piko_dl
	get_patches_key "twitter-piko"
	get_apk "com.twitter.android" "twitter" "bundle"
	patch "twitter" "piko-newx" "twitter-universal-piko-newx"
}

1
