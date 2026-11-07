<div align="center">

# <picture><source srcset="assets/icons/help.svg"><img src="assets/icons/help.svg" width="32" height="32" alt="FAQ" /></picture> Frequently Asked Questions

**Answers to common questions about APK Forge, Morphe framework, MicroG, and build customization.**

[⬅ Back to Main README](README.md)

</div>

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

## Table of Contents
- [Morphe Ecosystem & Upstream Transition](#-morphe-ecosystem--upstream-transition)
- [MicroG & Playback Issues](#-microg--playback-issues)
- [Forking & Building Your Own Apps](#-forking--building-your-own-apps)
- [Customizing Patches & Options](#-customizing-patches--options)
- [Safety, Security & Keystore Updates](#-safety-security--keystore-updates)
- [Bug Reports & Troubleshooting](#-bug-reports--troubleshooting)

---

## 🚀 Morphe Ecosystem & Upstream Transition

### Q: What is Morphe, and why are ReVanced / ReVanced Extended developers moving there?
**Morphe** is the next-generation modular patching framework and command-line engine for Android applications. 

As original ReVanced and ReVanced Extended tools evolved, key maintainers and community developers transitioned toward Morphe to build a faster, more resilient, and cleaner architecture:
- **[Morphe Patches](https://github.com/MorpheApp/morphe-patches)**: The actively maintained patch bundle for YouTube, YouTube Music, and other core Android apps.
- **[Morphe CLI](https://github.com/MorpheApp/morphe-cli)**: High-speed, lightweight CLI patcher engineered for modern CI/CD runners and local compilation.
- **[MicroG RE (GmsCore)](https://github.com/MorpheApp/MicroG-RE)**: Redesigned, lightweight Google Play Services compatibility framework optimized for performance and lower battery consumption.

**APK Forge** uses the Morphe ecosystem alongside LSPatch as its primary build and patching engine.

---

## 🔑 MicroG & Playback Issues

### Q: Video stops playing after 10–30 seconds, or buffers indefinitely. How do I fix it?
This is almost always caused by OEM Android battery management killing or freezing the background MicroG process.

1. **Disable Battery Optimization**:
   - Go to Android **Settings &rarr; Apps &rarr; MicroG Services (GmsCore)**.
   - Set Battery usage to **Unrestricted** (or disable "Battery Optimization").
2. **OEM-Specific Restrictions**:
   - Devices from Samsung, Xiaomi (MIUI/HyperOS), OnePlus, and Huawei have aggressive battery killers. Visit **[dontkillmyapp.com](https://dontkillmyapp.com/)** for exact instructions for your phone brand.
3. **App Settings Verification**:
   - Inside the patched YouTube app, go to **Settings &rarr; Morphe &rarr; Miscellaneous** and ensure that client spoofing (e.g., *Spoof app client*) is enabled.

---

### Q: Which MicroG RE version should I download?
Download the latest build from the **[MorpheApp/MicroG-RE Releases](https://github.com/MorpheApp/MicroG-RE/releases/latest)** page:
- **Recommended (Most modern phones)**: `microg-*-icon-arm64-v8a.apk` (~43.5 MB). Contains only 64-bit ARM native libraries; less than half the size of universal.
- **Universal (Safe fallback)**: `microg-*.apk` (~108 MB). Works on all Android devices (32-bit & 64-bit).
- **Legacy 32-bit devices**: `microg-*-icon-armeabi-v7a.apk` (~41.4 MB).
- **Hidden Launcher Icon (`-noicon`)**: Choose `-noicon` variants if you do not want the MicroG icon cluttering your app drawer (settings remain accessible via Android System Settings &rarr; Apps).

---

## 🛠️ Forking & Building Your Own Apps

### Q: How do I fork this repository and build patched apps on my own GitHub account?
You can easily build your own APKs without setting up a local Android development environment:

1. **Fork the Repository**:
   - Click the **Fork** button at the top right of the [apk-forge repository](https://github.com/jsoul-dev/apk-forge).
2. **Enable GitHub Actions**:
   - Navigate to the **Actions** tab in your newly forked repository.
   - Click the green button: **"I understand my workflows, go ahead and enable them"**.
3. **Run a Build**:
   - In the left sidebar of the Actions tab, click **1. Manual Patch**.
   - Click **Run workflow**, select the application or patch suite you want to build, and trigger the workflow.
4. **Download Your APKs**:
   - Once the build succeeds, download the resulting binaries directly from your fork's **Releases** tab under tag **`all`** (or from the workflow run artifacts).

---

## 🎨 Customizing Patches & Options

### Q: How do I customize which patches are included or excluded?
In the root of the repository, navigate to `src/patches/<app-name>/`. Each folder corresponds to a supported application and contains two configuration files:

- **`include-patches`**: Place patch names you wish to explicitly force-include (one per line).
- **`exclude-patches`**: Place patch names you wish to disable (one per line).

You can explore available patch names for each target in their respective upstream repositories:
- **YouTube & YouTube Music**: [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches)
- **Brave & Brave Beta**: [dh6k/morphe-patches](https://github.com/dh6k/morphe-patches)
- **Facebook, Messenger, Instagram & TikTok**: [SysAdminDoc](https://github.com/SysAdminDoc)
- **Twitter / X**: [crimera/piko-newx](https://github.com/crimera/piko-newx)
- **Duolingo, Proton Mail & Proton VPN**: [hxreborn/morphe-patches](https://github.com/hxreborn/morphe-patches)
- **Pinterest**: [browzomje/browzomje-patches](https://github.com/browzomje/browzomje-patches)
- **Google Photos**: [Akash-Sriram/morphe-google-photos](https://github.com/Akash-Sriram/morphe-google-photos)
- **Gboard**: [jasonwu1994/Gboard-patches](https://github.com/jasonwu1994/Gboard-patches)
- **Discord**: [revenge-mod/revenge-xposed](https://github.com/revenge-mod/revenge-xposed)

---

### Q: How do I configure custom patch options or branding?
You can supply custom parameters (such as custom app titles, header adjustments, or package flags):
- **Via JSON file**: Place or edit configuration files under `src/options/<app>.json`.
- **Inline in `include-patches`**: Separate the patch name and argument using the pipe (`|`) symbol:
  ```text
  Custom branding|-OappName="YouTube Morphe" -OiconPath=assets/branding
  ```

---

## 🔒 Safety, Security & Keystore Updates

### Q: Are these patched APKs safe to use?
**Yes.**
- **100% Transparent Build Pipeline**: Every single APK is compiled directly inside isolated, ephemeral GitHub Actions virtual environments. The entire workflow source code and build scripts are public.
- **Direct Official Bases**: Base APK files are fetched from verified repositories and official Google Play Store sessions without third-party intermediate repacking.
- **No Injected Malware**: Patches are applied strictly using open-source, community-audited tools (Morphe CLI, LSPatch).

---

### Q: Can I install updates directly over my current installation without uninstalling?
**Yes**, provided your previously installed APK was signed with the same keystore. All Morphe applications compiled by this repository are signed using `src/keystore/morphe.keystore`, enabling seamless over-the-air updates without data loss.

---

## 🐛 Bug Reports & Troubleshooting

### Q: An app is crashing on startup or a specific patch is broken. Where do I report it?
- **Workflow & Download Issues**: If a build fails in GitHub Actions or an APK download link is broken, open an issue in the **[apk-forge Issues](https://github.com/jsoul-dev/apk-forge/issues)** tracker.
- **In-App Bugs & Patch Glitches**: Because APK Forge is an automated CI/CD builder and does not author the patches, app-level bugs should be reported upstream to the appropriate maintainer linked in the [README.md](README.md#disclaimer--credits).

---

<p align="center">
  <picture>
    <source srcset="assets/divider.svg">
    <img src="assets/divider.svg" width="100%" height="4" alt="divider" />
  </picture>
</p>

<div align="center">
  <sub>Adapted and expanded from the foundational FAQ by <a href="https://github.com/FiorenMas">FiorenMas</a>.</sub>
</div>
