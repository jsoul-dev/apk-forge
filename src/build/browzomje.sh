#!/bin/bash
# Pinterest build (browzomje patches)
source ./src/build/utils.sh

browzomje_dl() {
	dl_gh "morphe-desktop" "MorpheApp" "latest"
	dl_gh "browzomje-patches" "browzomje" "latest"
}

1() {
	browzomje_dl
	get_patches_key "pinterest-browzomje"
	get_apk "com.pinterest" "pinterest" "apk"
	patch "pinterest" "browzomje"
}

1
