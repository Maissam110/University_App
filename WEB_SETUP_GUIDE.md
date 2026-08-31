# Flutter Web Setup Guide

## Prerequisites
- Flutter installed and configured for web
- Firebase project set up
- Google Cloud Console access

## Step 1: Enable Web Support

If not already enabled, run:
```bash
flutter config --enable-web
```

## Step 2: Build and Run Web

To run the project on web:
```bash
flutter run -d chrome
```

Or build for production:
```bash
flutter build web --release
```

## Step 3: Configure Google Sign-In for Web

### Important: Update Web Client ID

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your project
3. Navigate to Credentials
4. Find your OAuth 2.0 Client ID (if not found, create one for "Web application")
5. Copy the Client ID

### Update the Code

Open `lib/view/one time screen/services/google_auth_service.dart` and replace:
```dart
clientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com',
```

With your actual Web Client ID:
```dart
clientId: '1234567890-abcdefghijklmnop.apps.googleusercontent.com',
```

## Step 4: Configure Firebase for Web

The project already has Firebase configured. Ensure your Firebase configuration in `lib/firebase_options.dart` includes proper web settings.

## Step 5: Update Authorized Redirect URIs

In Google Cloud Console:
1. Go to Credentials
2. Click on your OAuth 2.0 Web application client
3. Under "Authorized redirect URIs", add:
   - `http://localhost:7357` (for local development)
   - `https://yourdomain.com/callback` (for production)

Note: The exact port may vary, Flutter will show it when you run the app.

## Step 6: Enable Required APIs

Make sure these APIs are enabled in your Google Cloud Console:
- Google Identity Services API
- Firebase Authentication API
- Cloud Firestore API

## Testing on Web

1. Run the project:
   ```bash
   flutter run -d chrome
   ```

2. Click "Continue with google" button
3. You should see a Google Sign-In prompt (may be different from mobile - could be popup or redirect)
4. After successful authentication, you'll be logged in

## Troubleshooting

### "Google Sign-In not initialized" error
- Ensure the Web Client ID is correctly set in `google_auth_service.dart`
- Check that the domain is added to authorized redirect URIs

### CORS Issues
- Make sure your domain is whitelisted in Google Cloud Console
- Check browser console for detailed CORS error messages

### Sign-In not working
- Check browser console (F12) for JavaScript errors
- Ensure Google Sign-In JavaScript library is loaded (check network tab)
- Verify OAuth 2.0 credentials are valid

## Web-Specific Considerations

1. **Authentication Flow**: On web, Google Sign-In may show a popup or redirect depending on browser settings
2. **Session Persistence**: Web sessions may persist across browser refreshes
3. **HTTPS Required**: For production, HTTPS is required for OAuth 2.0 to work
4. **Popup Blockers**: Users with popup blockers may need to allow popups for sign-in to work

## Building for Production

```bash
flutter build web --release
```

Deploy the contents of `build/web` to your web server.

For more information, visit:
- [Flutter Web Documentation](https://flutter.dev/docs/get-started/web)
- [Google Sign-In for Flutter](https://pub.dev/packages/google_sign_in)
- [Firebase Authentication Web Setup](https://firebase.google.com/docs/auth/web/start)
