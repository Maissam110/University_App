import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university/view/one%20time%20screen/services/google_auth_service.dart';

void main() {
  test('uses native google sign-in on mobile platforms', () {
    final service = FirebaseService();
    final nativeExpected =
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS);

    expect(service.shouldUseNativeGoogleSignIn, nativeExpected);
  });

  test('uses Firebase popup on web and desktop platforms', () {
    final service = FirebaseService();
    final popupExpected =
        kIsWeb ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS;

    expect(service.shouldUseFirebasePopup, popupExpected);
  });
}
