#!/bin/bash
# Google Photos build (Akash-Sriram morphe-google-photos)
source ./src/build/utils.sh

photos_dl() {
	dl_gh "morphe-desktop" "MorpheApp" "latest"
	dl_gh "morphe-google-photos" "Akash-Sriram" "latest"
}

1() {
	photos_dl
	get_patches_key "google-photos-morphe"
	get_apk "com.google.android.apps.photos" "google-photos-arm64-v8a" "apk"
	patch "google-photos-arm64-v8a" "google-photos"
}

1
