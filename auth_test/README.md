# Working with local Authentication by Biometric

## Getting Started
First of all, you should add packages to pubspec.yaml
- local_auth: ^2.3.0          -   Local Authentication
- local_auth_android: ^1.0.46 -   For AndroidAuthMessages  
- local_auth_darwin: ^1.4.1   -   For IOSAuthMessages
- get_it: ^8.0.2              -   Dependency Injection

## Android

### Change in gradle file
- compileSdk = 34
- ndkVersion = "27.0.12077973"
- minSdk = 23
- targetSdk = 34

### Add to AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
    <application>
    ...
    </application>
</manifest>

### Change in MainActivity.kt
import io.flutter.embedding.android.FlutterFragmentActivity
class MainActivity: FlutterFragmentActivity() {
}

## iOS

### Add to ios/Runner/info.plist
<dict>
    <key>NSFaceIDUsageDescription</key>
    <string>This app authenticating using biometric</string>
    ...
</dict>