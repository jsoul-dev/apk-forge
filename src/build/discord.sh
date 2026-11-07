#!/bin/bash
# Discord build (revenge-mod via LSPatch)
source ./src/build/utils.sh

lspatch_dl() {
	dl_gh "LSPatch" "JingMatrix" "latest"
	dl_gh "revenge-xposed" "revenge-mod" "latest"
}

1() {
	lspatch_dl
	get_apk "com.discord" "discord" "bundle"
	lspatch "discord" "app-release" "revenge"
}

1
