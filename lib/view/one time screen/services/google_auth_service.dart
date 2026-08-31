import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  FirebaseAuth get auth => FirebaseAuth.instance;
  GoogleSignIn get googleSignIn => GoogleSignIn.instance;

  bool _initializingInProgress = false;
  bool _initialized = false;

  bool get shouldUseNativeGoogleSignIn =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  bool get shouldUseFirebasePopup =>
      kIsWeb ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS;

  Future<void> initializeGoogleSignIn() async {
    if (_initialized) {
      return;
    }

    if (_initializingInProgress) {
      int attempts = 0;
      while (_initializingInProgress && attempts < 100) {
        await Future.delayed(const Duration(milliseconds: 100));
        attempts++;
      }
      return;
    }

    _initializingInProgress = true;

    try {
      if (shouldUseNativeGoogleSignIn) {
        await googleSignIn.initialize();
        _initialized = true;
        debugPrint('Google Sign-In initialized for native mobile auth');
      } else {
        _initialized = true;
        debugPrint(
          'Google Sign-In uses Firebase popup for ${kIsWeb ? 'web' : 'desktop'} platform',
        );
      }
    } catch (e) {
      debugPrint('Error initializing Google Sign In: $e');
      rethrow;
    } finally {
      _initializingInProgress = false;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (!_initialized) {
        await initializeGoogleSignIn();
      }

      if (shouldUseNativeGoogleSignIn) {
        return await _signInWithGoogleNative();
      }

      return await _signInWithGoogleWeb();
    } on FirebaseAuthException catch (e) {
      debugPrint('Firebase Auth Error: ${e.code} - ${e.message}');
      throw e;
    } catch (e) {
      debugPrint('Google Sign-In Error: $e');
      throw e;
    }
  }

  Future<UserCredential?> _signInWithGoogleNative() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );

      debugPrint(
        'User signed in successfully (Native): ${userCredential.user?.email}',
      );
      return userCredential;
    } catch (e) {
      debugPrint('Native Google Sign-In Error: $e');
      rethrow;
    }
  }

  Future<UserCredential?> _signInWithGoogleWeb() async {
    try {
      final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      googleAuthProvider.setCustomParameters({'prompt': 'select_account'});

      final UserCredential userCredential = await auth.signInWithPopup(
        googleAuthProvider,
      );

      debugPrint(
        'User signed in successfully (${kIsWeb ? 'Web' : 'Desktop'}): ${userCredential.user?.email}',
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        debugPrint(
          'Account exists with different credential for user: ${e.email}',
        );
      } else if (e.code == 'invalid-credential') {
        debugPrint('Invalid credential');
      }
      rethrow;
    } catch (e) {
      debugPrint('Web/Desktop Sign-In Error: $e');
      throw e;
    }
  }

  Future<void> googleSignOut() async {
    try {
      await auth.signOut();

      if (shouldUseNativeGoogleSignIn) {
        await googleSignIn.signOut();
      }

      debugPrint('User signed out successfully');
    } catch (e) {
      debugPrint('Sign Out Error: $e');
      throw e;
    }
  }
}
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:google_sign_in/google_sign_in.dart';

// // class FirebaseService {
// //   final FirebaseAuth auth = FirebaseAuth.instance;

// //   // Create GoogleSignIn instance
// //   final GoogleSignIn googleSignIn = GoogleSignIn();

// //   Future<UserCredential?> signInWithGoogle() async {
// //     try {
// //       // Trigger the Google authentication flow
// //       final GoogleSignInAccount? googleSignInAccount = await googleSignIn
// //           .signIn();

// //       if (googleSignInAccount != null) {
// //         // Obtain authentication details from the request
// //         final GoogleSignInAuthentication googleSignInAuthentication =
// //             googleSignInAccount.authentication;

// //         // Create a new credential for Firebase
// //         final AuthCredential credential = GoogleAuthProvider.credential(
// //           accessToken: googleSignInAuthentication.accessToken,
// //           idToken: googleSignInAuthentication.idToken,
// //         );

// //         // Sign in to Firebase with credential and return result
// //         return await auth.signInWithCredential(credential);
// //       }
// //       return null; // User canceled the sign-in
// //     } on FirebaseAuthException catch (e) {
// //       print("Firebase Auth Error: ${e.message}");
// //       rethrow;
// //     } catch (e) {
// //       print("General Sign-In Error: $e");
// //       rethrow;
// //     }
// //   }

// //   Future<void> googleSignOut() async {
// //     await auth.signOut();
// //     await googleSignIn.signOut();
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseService {
//   // Create Firebase Auth instance
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   // Create Google Sign In instance
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   // Method to sign in using Google
//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       // Trigger the Google authentication flow
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();

//       // Proceed only if the user selected an account
//       if (googleSignInAccount != null) {
//         // Retrieve authentication tokens from Google
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;

//         // Create Firebase credential
//         final AuthCredential authCredential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );

//         // Sign in to Firebase and return credentials
//         return await auth.signInWithCredential(authCredential);
//       }
//       return null; // Return null if user canceled sign-in
//     } on FirebaseAuthException catch (e) {
//       print('Firebase Auth Error: ${e.message}');
//       rethrow;
//     } catch (e) {
//       print('General Error: $e');
//       rethrow;
//     }
//   }

//   // Method to sign out from both Firebase and Google
//   Future<void> googleSignOut() async {
//     await auth.signOut();
//     await googleSignIn.signOut();
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseService {
//   // Create Firebase Auth instance
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   // Create Google Sign In instance
//   static final GoogleSignIn googleSignIn = GoogleSignIn.instance;
//   static final Future<void> googleSignInInitialization = googleSignIn
//       .initialize();

//   // Method to sign in using Google
//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       await googleSignInInitialization;

//       // Trigger the Google authentication flow
//       final GoogleSignInAccount googleSignInAccount = await googleSignIn
//           .authenticate();

//       // Create Firebase credential from the Google ID token.
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           googleSignInAccount.authentication;
//       final AuthCredential authCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//       );

//       // Sign in to Firebase and return credentials
//       return await auth.signInWithCredential(authCredential);
//     } on FirebaseAuthException catch (e) {
//       if (kDebugMode) {
//         print('Firebase Auth Error: ${e.message}');
//       }
//       rethrow;
//     } catch (e) {
//       if (kDebugMode) {
//         print('General Error: $e');
//       }
//       rethrow;
//     }
//   }

//   // Method to sign out from both Firebase and Google
//   Future<void> googleSignOut() async {
//     await googleSignInInitialization;
//     await auth.signOut();
//     await googleSignIn.signOut();
//   }
// }
