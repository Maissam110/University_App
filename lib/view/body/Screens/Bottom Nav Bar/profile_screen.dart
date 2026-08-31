import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:university/Provider/theme_provider.dart';
import 'package:university/view/one%20time%20screen/services/google_auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  Watch the current theme mode
    final themeMode = ref.watch(themeNotifierProvider);
    //  Used to toggle theme
    final notifier = ref.read(themeNotifierProvider.notifier);
    // Check id the Theme is Dark
    final isDark = themeMode == ThemeMode.dark;
    //  Use Sceondary color for UI
    final color = Theme.of(context).colorScheme.secondary;

    //  Privacy Policy
    final url =
        "https://www.freeprivacypolicy.com/live/ba362c8b-23b8-4221-af1c-3d066ca01f23";
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "${FirebaseAuth.instance.currentUser!.photoURL ?? Icon(Icons.account_circle_sharp)}",
                ),
              ),

              //  For Name
              Text(
                "Name: ${FirebaseAuth.instance.currentUser!.displayName}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: color,
                ),
              ),

              //  For Email
              Text(
                "Email: ${FirebaseAuth.instance.currentUser!.email}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: color,
                ),
              ),
              SizedBox(height: 10),
              Divider(color: color),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.policy, size: 30, color: color),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () async {
                      //  First add this required things before used it
                      await launchUrl(Uri.parse(url));
                    },
                    child: Text(
                      "Privacy & Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: notifier.toggleTheme,
                    child: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      size: 30,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Theme",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.star, size: 30, color: color),
                  SizedBox(width: 15),
                  Text(
                    "Rate",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.share, size: 30, color: color),
                  SizedBox(width: 15),
                  Text(
                    "Share",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await FirebaseService().googleSignOut();
                    },
                    child: Icon(Icons.exit_to_app, size: 30, color: color),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Log Out",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
