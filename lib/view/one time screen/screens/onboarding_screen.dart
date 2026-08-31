import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:university/Model/onboarding_screen_model.dart';
import 'package:university/route.dart';
import 'package:university/view/one%20time%20screen/screens/splash_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  // Track the correct index
  int _currentPage = 0;
  List<OnboardingModel> onboardingData = [];

  // override Function
  @override
  void initState() {
    super.initState();

    _loadOnBoardingData();
  }

  //  Function to fetch onboarding data from firebase
  Future<void> _loadOnBoardingData() async {
    //fff
    final snapshot = await FirebaseFirestore.instance
        .collection("OnboardingScreens")
        .get();
    //  Map firestore data on onboadring screen
    if (mounted) {
      setState(() {
        onboardingData = snapshot.docs
            .map((doc) => OnboardingModel.fromFirestore(doc))
            .toList();
      });
    }
  }

  // Next Button
  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onboardingData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: onboardingData.length,
                    onPageChanged: (value) {
                      setState(() {
                        // ss
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final items = onboardingData[index];
                      return Column(
                        children: [
                          // Image
                          Image.network(
                            items.image,
                            height: 450,
                            width: double.maxFinite,
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(height: 40),

                          // Title
                          Text(
                            items.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 20),

                          // SubTitle
                          Text(
                            items.subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  //  Skip button
                  if (_currentPage != onboardingData.length - 1)
                    Positioned(
                      top: 0,
                      right: 15,
                      child: TextButton(
                        onPressed: () {
                          //  Jump directly to the last page
                          _controller.jumpToPage(onboardingData.length - 1);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),

                  // page Indicator and button at hte end
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        children: [
                          //  Page Indicators (...)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingData.length,
                              ((index) => AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: _currentPage == index ? 20 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? Colors.blue
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(width: 85),
                          //  Get Started Button
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.maxFinite, 50),
                                backgroundColor: Colors.blue,
                              ),
                              onPressed:
                                  _currentPage == onboardingData.length - 1
                                  ? () {
                                      NavigationHelper.push(
                                        context,
                                        SplashScreen(),
                                      );
                                    }
                                  : _nextPage,
                              child: Text(
                                _currentPage == onboardingData.length - 1
                                    ? "Get Started"
                                    : "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
