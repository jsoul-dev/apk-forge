<div align="center">

# <picture><source srcset="assets/icons/forge.svg"><img src="assets/icons/forge.svg" width="32" height="32" alt="Forge" /></picture> APK Forge

**Automated, continuously updated Android applications patched with modern Morphe & LSPatch frameworks.**

[![APK Collection](https://img.shields.io/badge/Release-APK%20Collection%20(Tag:%20all)-0070F3?style=for-the-badge&logo=github)](../../releases/tag/all)
[![Patch Checker](https://img.shields.io/github/actions/workflow/status/jsoul-dev/apk-forge/ci.yml?label=Patch%20Checker&style=for-the-badge)](../../actions/workflows/ci.yml)
[![MicroG RE](https://img.shields.io/badge/Prerequisite-MicroG%20RE-8A2BE2?style=for-the-badge&logo=android)](https://github.com/MorpheApp/MicroG-RE)

</div>

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/workflow.svg"><img src="assets/icons/workflow.svg" width="22" height="22" alt="Workflow" /></picture> How This Repository Works

> [!NOTE]
> ### Unified APK Collection
> Unlike repositories that flood GitHub with dozens of scattered releases, **this repository maintains a single unified release hub ([tag: `all`](../../releases/tag/all)) titled "APK Collection"**.
> - When an upstream patch maintainer releases an update, our GitHub Actions workflow detects it, rebuilds only that application, and **updates the file in place**.
> - You can bookmark direct download links knowing they always resolve to the newest patched build.

> [!IMPORTANT]
> ### MicroG RE Requirement
> To sign in and use **YouTube**, **YouTube Music**, or **Google Photos**, you must install [MicroG RE](https://github.com/MorpheApp/MicroG-RE/releases/latest) on your device.

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/compass.svg"><img src="assets/icons/compass.svg" width="22" height="22" alt="Navigation" /></picture> Quick Navigation

| [Media & Streaming](#media--streaming) | [Social & Messaging](#social--messaging) | [Web & Input](#web--input) | [Privacy & Utilities](#privacy--utilities) | [Architecture Guide](#architecture-guide) | [FAQ](#frequently-asked-questions) |
|---|---|---|---|---|---|

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/media.svg"><img src="assets/icons/media.svg" width="22" height="22" alt="Media" /></picture> Media & Streaming

| Application | Patch Source | Architecture | Min Android | Direct Download | Notes |
|:---|:---|:---|:---:|:---:|:---|
| **YouTube** | [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) | **All Architectures (Universal)** | Android 9.0+ | [Download APK](../../releases/download/all/youtube-universal-morphe.apk) | Ad blocking, background playback, SponsorBlock, Return YouTube Dislike. Requires MicroG. |
| **YouTube Music** | [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) | **Arm64-v8a** | Android 8.0+ | [Download APK](../../releases/download/all/youtube-music-arm64-v8a-morphe.apk) | Background audio, ad-free streaming, audio-only mode. Requires MicroG. |
| **TikTok** | [SysAdminDoc/hushfeed](https://github.com/SysAdminDoc/hushfeed) | **Dual-Arch (`arm64-v8a` + `v7a`)** | Android 6.0+ | [Download APK](../../releases/download/all/tiktok-dual-arch-hushfeed.apk) | Removes sponsored posts & ads, bypasses regional download blocks, playback speed adjustments. |

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/social.svg"><img src="assets/icons/social.svg" width="22" height="22" alt="Social" /></picture> Social & Messaging

| Application | Patch Source | Architecture | Min Android | Direct Download | Notes |
|:---|:---|:---|:---:|:---:|:---|
| **Facebook** | [SysAdminDoc/Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook) | **Arm64-v8a** | Android 11.0+ | [Download APK](../../releases/download/all/facebook-arm64-v8a-hushfacebook.apk) | Hides sponsored ads & suggested reels/feed clutter, media download support, in-app Hush settings. |
| **Messenger** | [SysAdminDoc/HushMessenger](https://github.com/SysAdminDoc/HushMessenger) | **Arm64-v8a** | Android 9.0+ | [Download APK](../../releases/download/all/messenger-arm64-v8a-hushmessenger.apk) | Removes chat ads, original quality media transmission, UI decluttering. |
| **Instagram** | [SysAdminDoc/HushGram](https://github.com/SysAdminDoc/HushGram) | **Arm64-v8a** | Android 9.0+ | [Download APK](../../releases/download/all/instagram-arm64-v8a-hushgram.apk) | Hides sponsored ads and shopping, media saver, ghost viewing options. |
| **Twitter / X** | [crimera/piko-newx](https://github.com/crimera/piko-newx) | **All Architectures (Universal)** | Android 9.0+ | [Download APK](../../releases/download/all/twitter-universal-piko-newx.apk) | Timeline ad removal, video & GIF downloading, custom theme & font tweaks. |
| **Pinterest** | [browzomje/browzomje-patches](https://github.com/browzomje/browzomje-patches) | **All Architectures (Universal)** | Android 10+ | [Download APK](../../releases/download/all/pinterest-universal-browzomje.apk) | Disables promoted pins, removes telemetry & tracking. |
| **Discord** | [revenge-mod/revenge-xposed](https://github.com/revenge-mod/revenge-xposed) | **All Architectures (Universal)** | Android 7.0+ | [Download APK](../../releases/download/all/discord-universal-revenge.apk) | Patched via LSPatch. Plugin support, custom themes, enhanced client functionality. |

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/web.svg"><img src="assets/icons/web.svg" width="22" height="22" alt="Web" /></picture> Web & Input

| Application | Patch Source | Architecture | Min Android | Direct Download | Notes |
|:---|:---|:---|:---:|:---:|:---|
| **Brave Browser** | [dh6k/morphe-patches](https://github.com/dh6k/morphe-patches) | **Arm64-v8a**<br>**Armeabi-v7a** | Android 10+ | • [arm64-v8a](../../releases/download/all/brave-browser-stable-arm64-v8a-dh6k.apk)<br>• [armeabi-v7a](../../releases/download/all/brave-browser-stable-armeabi-v7a-dh6k.apk) | Fast startup optimization, AMOLED dark theme, four-column NTP layout fix, privacy enhancements. |
| **Brave Browser Beta** | [dh6k/morphe-patches](https://github.com/dh6k/morphe-patches) | **Arm64-v8a**<br>**Armeabi-v7a** | Android 10+ | • [arm64-v8a](../../releases/download/all/brave-browser-beta-arm64-v8a-dh6k.apk)<br>• [armeabi-v7a](../../releases/download/all/brave-browser-beta-armeabi-v7a-dh6k.apk) | Early-access Chromium engine with all dh6k browser patches applied. |
| **Gboard** | [jasonwu1994/Gboard-patches](https://github.com/jasonwu1994/Gboard-patches) | **Arm64-v8a** | Android 10+ | [Download APK](../../releases/download/all/gboard-arm64-v8a-jasonwu1994.apk) | Clipboard upgrades, custom themes & blur, toolbar shortcuts, OCR scanning, flag editor. |

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/privacy.svg"><img src="assets/icons/privacy.svg" width="22" height="22" alt="Privacy" /></picture> Privacy & Utilities

| Application | Patch Source | Architecture | Min Android | Direct Download | Notes |
|:---|:---|:---|:---:|:---:|:---|
| **Duolingo** | [hxreborn/morphe-patches](https://github.com/hxreborn/morphe-patches) | **All Architectures (Universal)** | Android 10+ | [Download APK](../../releases/download/all/duolingo-universal-hxreborn.apk) | Ad-free learning experience, unlimited hearts, AMOLED theme support. |
| **Proton Mail** | [hxreborn/morphe-patches](https://github.com/hxreborn/morphe-patches) | **All Architectures (Universal)** | Android 10+ | [Download APK](../../releases/download/all/protonmail-universal-hxreborn.apk) | Pure black AMOLED dark theme, cleaner layout. |
| **Proton VPN** | [hxreborn/morphe-patches](https://github.com/hxreborn/morphe-patches) | **All Architectures (Universal)** | Android 8.0+ | [Download APK](../../releases/download/all/protonvpn-universal-hxreborn.apk) | AMOLED dark theme, visual cleanup. |
| **Google Photos** | [Akash-Sriram/morphe-google-photos](https://github.com/Akash-Sriram/morphe-google-photos) | **Arm64-v8a** | Android 7.0+ | [Download APK](../../releases/download/all/google-photos-arm64-v8a-akash-sriram.apk) | Unlimited backup spoofing, magic editor unlocking. Requires MicroG. |

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/cpu.svg"><img src="assets/icons/cpu.svg" width="22" height="22" alt="Architecture" /></picture> Architecture Guide

To ensure you download the build that works best on your device:

| Architecture | Description | Which Apps Use It? |
|:---|:---|:---|
| **All Architectures (Universal)** | **Recommended.** Contains byte-compatible or multi-arch binaries that run on virtually any Android device (both 32-bit and 64-bit). | YouTube, Twitter / X, Discord, Pinterest, Duolingo, Proton Mail, Proton VPN |
| **Arm64-v8a** | Optimized for 64-bit ARM processors found in all modern smartphones (manufactured since ~2016). Smaller footprint and faster load times. | YouTube Music, Facebook, Messenger, Instagram, TikTok, Brave, Gboard, Google Photos |
| **Armeabi-v7a** | Legacy 32-bit ARM architecture for older smartphones and lightweight Android devices. | Brave Browser (32-bit build), Brave Beta (32-bit build) |

> [!TIP]
> **No x86, x86_64, or stripped APK-Lite builds:** To prevent flooding the release page and eliminate slow CI build times, legacy desktop emulators (`x86`) and aggressive split-strip variants have been removed.

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/help.svg"><img src="assets/icons/help.svg" width="22" height="22" alt="FAQ" /></picture> Frequently Asked Questions

<details>
<summary><b>1. Can I install updates directly over my current patched app without uninstalling?</b></summary>
<br>
Yes, as long as both APKs were signed with the same keystore. All Morphe-patched applications in this repository are signed with the project's consistent keystore (<code>morphe.keystore</code>), allowing you to install updates over existing builds without wiping application data.
</details>

<details>
<summary><b>2. YouTube / YouTube Music / Google Photos crashes on launch or won't log in. What do I do?</b></summary>
<br>
Install <a href="https://github.com/MorpheApp/MicroG-RE/releases/latest">MicroG RE</a> first, then disable battery optimization for MicroG RE in your phone's Android settings to ensure smooth background synchronization.
</details>

<details>
<summary><b>3. How often are the APKs updated?</b></summary>
<br>
A scheduled GitHub Actions workflow runs every day at 09:00 UTC. It queries the GitHub Releases API of each upstream patch repository. If a newer patch bundle has been released, the workflow downloads the corresponding base APK, patches it, and updates the file directly in the <a href="../../releases/tag/all">all release</a>.
</details>

<details>
<summary><b>4. How can I manually trigger a build?</b></summary>
<br>
Navigate to the <a href="../../actions/workflows/manual-patch.yml">Actions tab &rarr; 1. Manual Patch</a>, click <b>Run workflow</b>, and select the application or patch suite you want to build.
</details>

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## <picture><source srcset="assets/icons/scale.svg"><img src="assets/icons/scale.svg" width="22" height="22" alt="Disclaimer" /></picture> Disclaimer & Credits

This project does not host, modify, or distribute proprietary code directly within this Git repository. All modifications are applied at build time using open-source patch bundles and CLI frameworks.

- [FiorenMas](https://github.com/FiorenMas) for the foundational workflow architecture, CI automation, and repository template that this project streamlined.
- [Morphe](https://github.com/MorpheApp) & [ReVanced](https://github.com/ReVanced) for patch and patcher frameworks.
- [dh6k](https://github.com/dh6k/morphe-patches), [SysAdminDoc](https://github.com/SysAdminDoc), [hxreborn](https://github.com/hxreborn/morphe-patches), [crimera](https://github.com/crimera), [browzomje](https://github.com/browzomje), [Akash-Sriram](https://github.com/Akash-Sriram), [jasonwu1994](https://github.com/jasonwu1994), and [revenge-mod](https://github.com/revenge-mod) for patch authoring and maintenance.
- All trademarks and brand names belong to their respective copyright holders.
