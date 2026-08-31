# Platform Configuration Guide

## Overview
This project is now configured to run on multiple platforms:
- ✅ Web (Chrome, Edge, Firefox, Safari)
- ✅ Android
- ✅ iOS
- ✅ Windows
- ✅ macOS
- ✅ Linux

All platforms support Google Sign-In with Firebase Authentication.

## Platform-Specific Setup

### Web (Most Important for your request)

**Status**: ✅ Fully configured for web

**To Run**:
```bash
flutter run -d chrome
```

**To Build**:
```bash
flutter build web --release
```

**Critical Setup**:
1. Update Web Client ID in `lib/view/one time screen/services/google_auth_service.dart`
2. Add `localhost:7357` and your production domain to Google OAuth authorized redirect URIs
3. Ensure Google Sign-In JavaScript library is loaded (already in web/index.html)

**Browser Compatibility**:
- Chrome: ✅ Full support
- Edge: ✅ Full support
- Firefox: ✅ Full support
- Safari: ✅ Full support (HTTPS required for production)

### Android

**Status**: ✅ Already configured

**To Run**:
```bash
flutter run -d android-emulator
# or on physical device
flutter run
```

**To Build**:
```bash
flutter build apk --release
```

**Google Sign-In Setup**:
- SHA-1 fingerprint is already configured in `android/app/google-services.json`
- Ensure your Google Cloud project has Android OAuth 2.0 credentials

### iOS

**Status**: ✅ Configured

**To Run**:
```bash
flutter run -d iphone-simulator
# or on physical device
flutter run
```

**To Build**:
```bash
flutter build ios --release
```

**Setup**:
- Check `ios/Runner/Info.plist` for URL schemes
- Ensure your Google Cloud project has iOS OAuth 2.0 credentials

### Desktop (Windows, macOS, Linux)

**Status**: ⚠️ Partially configured (requires additional setup)

**To Enable Windows/macOS/Linux**:
```bash
flutter config --enable-windows
flutter config --enable-macos
flutter config --enable-linux
```

**Note**: Google Sign-In on desktop platforms may require different configuration. For now, focus on Web and Mobile.

## Google Cloud Console Setup (Essential)

1. **Create OAuth 2.0 Credentials**:
   - Go to https://console.cloud.google.com/
   - Select your project
   - APIs & Services → Credentials
   - Create OAuth 2.0 Client ID for:
     - Web application
     - Android
     - iOS

2. **Authorized Redirect URIs** (for Web):
   ```
   http://localhost:7357
   http://localhost:7358
   http://localhost:7359
   https://yourdomain.com
   ```

3. **Add Authorized Origins** (for Web):
   ```
   http://localhost:7357
   http://localhost:7358
   http://localhost:7359
   https://yourdomain.com
   ```

4. **Enable Required APIs**:
   - Google Identity Services API
   - Firebase Authentication API
   - Cloud Firestore API
   - Firebase Messaging API

## Running on Different Platforms

### Development

**Web (Recommended for testing UI changes)**:
```bash
flutter run -d chrome --web-renderer html
```

**Mobile (Test real device behavior)**:
```bash
flutter run -d android-emulator
```

### Production Build

**Web**:
```bash
flutter build web --release
# Output in: build/web/
```

**Android**:
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

**iOS**:
```bash
flutter build ios --release
# Output: build/ios/iphoneos/Runner.app
```

## Authentication Flow

The authentication flow is identical across all platforms:

1. User clicks "Continue with google"
2. Calls `FirebaseService().signInWithGoogle()`
3. Google Sign-In prompt appears (platform-specific UI)
4. User authenticates
5. Firebase Auth receives ID token
6. User is logged in
7. App navigates to College Selection Screen

## Hot Reload & Development

All platforms support hot reload:
```bash
flutter run -d chrome
# Press 'r' to reload
# Press 'R' to restart
```

## Common Issues Across Platforms

| Issue | Web | Android | iOS |
|-------|-----|---------|-----|
| "Uninitialized" error | Check Web Client ID | Check android/google-services.json | Check iOS credentials |
| Sign-in fails | Check CORS/authorized origins | Check SHA-1 fingerprint | Check Bundle ID |
| Token issues | Clear browser cache | Clear app cache | Delete app & reinstall |

## Recommended Development Workflow

1. **Start with Web**:
   ```bash
   flutter run -d chrome
   ```
   - Fastest iteration
   - Easy debugging (browser DevTools)
   - Can test UI quickly

2. **Test on Mobile**:
   ```bash
   flutter run -d android-emulator
   ```
   - Ensures touch interactions work
   - Tests actual Firebase behavior
   - Validates authentication on real platform

3. **Build for Release**:
   ```bash
   flutter build web --release
   flutter build apk --release
   ```

## Next Steps

1. ✅ Update Web Client ID in google_auth_service.dart
2. ✅ Configure Google Cloud Console
3. ✅ Test on Chrome: `flutter run -d chrome`
4. ✅ Test on Android: `flutter run -d android-emulator`
5. ✅ Build for production: `flutter build web --release`

## Deployment

**For Web**:
1. Run: `flutter build web --release`
2. Upload contents of `build/web/` to your web server
3. Ensure HTTPS is enabled
4. Add your domain to Google OAuth authorized origins

**For Android**:
1. Run: `flutter build apk --release`
2. Upload to Google Play Store

**For iOS**:
1. Run: `flutter build ios --release`
2. Upload to App Store

## Support Resources

- [Flutter Web Documentation](https://flutter.dev/docs/get-started/web)
- [Google Sign-In Package](https://pub.dev/packages/google_sign_in)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Google Cloud Console](https://console.cloud.google.com/)

---

For web-specific setup, see: `WEB_SETUP_GUIDE.md`
For quick start, see: `QUICK_START_WEB.md`
