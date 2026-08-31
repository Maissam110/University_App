# Quick Start: Running on Web

## Option 1: Run on Chrome (Recommended for development)
```bash
cd c:\Users\Maissam Ali\Music\vsCode-flutter-project\university
flutter run -d chrome
```

## Option 2: Run on other browser
```bash
flutter run -d edge
flutter run -d firefox
```

## Build for Production
```bash
flutter build web --release
```

The web app will be built in `build/web/`

## Critical: Before running on web

⚠️ **IMPORTANT**: Update your Google Web Client ID in:
`lib/view/one time screen/services/google_auth_service.dart`

Replace this line:
```dart
clientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com',
```

With your actual Web Client ID from Google Cloud Console.

### How to get your Web Client ID:
1. Go to https://console.cloud.google.com/
2. Select your Firebase project
3. Go to APIs & Services → Credentials
4. Look for "OAuth 2.0 Client IDs" section
5. Click on the one labeled "Web application"
6. Copy the "Client ID" value

## Expected Behavior

- ✅ App loads on web (http://localhost:XXXX)
- ✅ "Continue with google" button works
- ✅ Shows Google Sign-In popup/redirect
- ✅ Logs user in via Firebase
- ✅ Navigates to College Selection screen
- ✅ Works the same as mobile version

## Supported Browsers
- Chrome ✅
- Edge ✅
- Firefox ✅
- Safari ✅ (may need HTTPS for production)

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| "This app isn't verified" | Add localhost:7357 to Google OAuth authorized origins |
| Sign-in popup not showing | Check browser popup blocker settings |
| "Invalid Client ID" | Ensure Web Client ID is correctly set |
| CORS error in console | Add your domain to authorized origins in Google Cloud |
| Blank page after login | Check browser console (F12) for errors |

See `WEB_SETUP_GUIDE.md` for detailed setup instructions.
