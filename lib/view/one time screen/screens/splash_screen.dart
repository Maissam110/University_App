import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lottie/lottie.dart';
import 'package:university/route.dart';
import 'package:university/view/body/college_selection_screen.dart';
import 'package:university/view/one%20time%20screen/services/google_auth_service.dart';

final FirebaseService _firebaseService = FirebaseService();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _firebaseService.googleSignIn.authenticationEvents.listen((event) {
      if (mounted) {
        // refresh the UI on authentication event
        setState(() {});
      }
    });
    //
    _initializeGoogleSignIn();

    super.initState();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _firebaseService.initializeGoogleSignIn();
      debugPrint('Google Sign-In initialized successfully');
    } catch (error) {
      debugPrint('Google Sign-In initialization failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF54E062),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.17),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green.shade900, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 130,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Lottie.network(
                "https://lottie.host/9ce9801e-e9de-473d-8848-ee979f58b166/4d3J6KaPv3.json",
                width: 200,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "University of Narowal",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final userCredential = await _firebaseService
                        .signInWithGoogle();

                    if (userCredential == null || userCredential.user == null) {
                      return;
                    }

                    if (mounted) {
                      NavigationHelper.push(context, CollegeSelectionScreen());
                    }
                  } catch (e) {
                    debugPrint('Sign-in failed: $e');
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign-in failed: $e')),
                      );
                    }
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  Google Icon
                      Image.asset(
                        'assets/images/google_logo.png',
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Continue with google",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          letterSpacing: -.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
