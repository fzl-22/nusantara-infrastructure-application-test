# nusantara_infrastructure_application_test

The **Nusantara Infrastructure Application Test** is an application intended for submission as part of the **Flutter Developer Intern Pre Test** for **Kampus Merdeka Batch 6**. This application has been developed using:

- Flutter 3.16.3

and has been tested on the following devices:

* Google Pixel 7 Pro (emulator device)
* Xiaomi POCO F4 (physical device)

The development environment for this application can be recreated using the following command:

```bash
avdmanager create avd --force --name Pixel_7_Pro --abi google_apis_playstore/x86_64 --package "system-images;android-34;google_apis_playstore;x86_64" --device 30
```

## 1 How to run this project

Clone the repository:

```bash
git clone git@github.com:fzl-22/nusantara-infrastructure-application-test.git
```

Navigate to the cloned repository:

```bash
cd nusantara-infrastructure-application-test
```

Install required dependencies:

```bash
flutter pub get
```

Make sure to connect to the Android device, then run the project:

```bash
flutter run
```

## 2 How to build this project

To build this application in release mode, run this following command:

```bash
flutter build apk --release
```

When the build completed, the release apk can be located at [build/app/outputs/flutter-apk/app-release.apk](build/app/outputs/flutter-apk/app-release.apk).

The application is ready to be installed on physical device.
