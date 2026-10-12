# Timetablr
**Timetablr** is an easy to use, iOS native timetabling app.

<img alt="screenshot of timetable view" src="https://github.com/user-attachments/assets/18d9a513-7a23-4ede-b8eb-a349a9664361" />


> [!WARNING]
> You will require a method of sideloading the IPA file, and a method to have the IPA file persist on device. I do not currently have the funds to publish to the iOS App Store.

## Features
- Day structure system
- Subject adding (probably a given)
- Colours
- Dynamic structure overrides
- Multiple week timetables
- Automatic multi-week timetable cycling
- Dark mode (wow)
- Haptics and feedback
- Accessibility settings (motion & haptics)

## Why even make a timetable app???
Most timetable apps on the App Store are quite old, and while people don't necessarily need new timetable software, the benefits of native SwiftUI apps can easily make a coherent and fast experience for new students needing timetable software. This was a fun project, that I personally have sideloaded on my device and actively use.

## Building
> [!NOTE]
> Timetablr is not currently on the App Store. Standard sideloading only lasts 7 days before being reloaded.

> [!IMPORTANT]
> A macOS device running macOS 26-27 is recommended for building.

You will need
- Xcode
- Git

1. git clone the repo - `git clone https://github.com/SunnyFloppyDiskStudios/Timetablr`
2. open the project using Xcode - (Open...) > timetablr.xcodeproj
3. (optional) clean build folder - SHIFT + COMMAND + K
4. build app - COMMAND + B

**Method 1 - build to device**

5. set simulator target (navbar) to physical plugged in device
6. press the run button to install the app onto device and run

**Method 2 - build IPA file**

5. Open Apple Shortcuts and create a new shortcut
6. Add "Run Shell Script" to the shortcut and add the following command:
```
cd {PATH TO TIMETABLR PROJECT ROOT}/timetablr/

xcodebuild archive -project {PATH TO TIMETABLR PROJECT ROOT}/timetablr/timetablr.xcodeproj -scheme timetablr -archivePath unsigned.xcarchive -configuration Release CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_ENTITLEMENTS="{PATH TO TIMETABLR PROJECT ROOT}/timetablr/timetablr/timetablr.entitlements"

cd {PATH TO TIMETABLR PROJECT ROOT}/timetablr/unsigned.xcarchive/Products

mv Applications Payload

zip -r Payload.zip Payload

mv Payload.zip Payload.ipa

mv {PATH TO TIMETABLR PROJECT ROOT}/timetablr/unsigned.xcarchive {PATH TO TIMETABLR PROJECT ROOT}/timetablr/Builds/unsigned.xcarchive

mv {PATH TO TIMETABLR PROJECT ROOT}/timetablr/Builds/unsigned.xcarchive/Products/Payload.ipa {PATH TO TIMETABLR PROJECT ROOT}/timetablr/Builds/
```
7. Replace `{PATH TO TIMETABLR PROJECT ROOT}` with the ... path to timetablr project root.
8. Run shortcut

## Current bugs / limitations
- Time does not cycle up in setup (not fully implemented)
- Editing a class colour doesn't always work (bugged)
- Day bar does not sync with viewed timetable (bugged)
- Some visual bugs

## Planned features
- More animations (like from setup to content, or adding classes into slots
- Horizontal timetable view (whole week)
- Looping timetable (i.e. Friday > Monday ... loop again)

___
{ 2026 } [sunnyflops.net](https://sunnyflops.net)

_This application was also submitted towards the NCEA level 2 iAS91893, iAS91896, iAS91897, eAS91899 standards. As a result, all work is my own, and no generative AI was used in the creation of this project._
