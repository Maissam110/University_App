import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("About the Developer"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main COntent
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    backgroundImage: AssetImage("assets/images/logo.png"),
                  ),
                  title: Text(
                    "Maissam Ali",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: color,
                    ),
                  ),
                  subtitle: Text(
                    "Flutter App Developer",
                    style: TextStyle(color: color),
                  ),
                ),
                Text(
                  "A Developer who build this university app from scratch to gain the experience and to gain the knowledge, how firebase is work with app in real time.",
                  style: TextStyle(color: color),
                ),
                SizedBox(height: 10),
                Text(
                  "Connect with me",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 22,
                  ),
                ),
                Row(
                  children: [
                    //
                    socialNetwork(
                      context,
                      "https://github.com/Maissam110",
                      "https://cdn-icons-png.flaticon.com/512/25/25231.png",
                    ),
                    socialNetwork(
                      context,
                      "https://github.com/Maissam110",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE264cyqlcIpV9jQn_DWUOoxyXlu1oTEMExotZtozbPQ&s=10",
                    ),
                    socialNetwork(
                      context,
                      "https://github.com/Maissam110",
                      "https://cdn-icons-png.flaticon.com/512/81/81341.png",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 1,
              color: Theme.of(context).primaryColor,
              shadowColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      "Support & Feedback",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: color,
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      leading: Icon(Icons.bug_report, color: color),
                      title: Text(
                        "Report a bug",
                        style: TextStyle(
                          //
                          color: color,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: color,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.lightbulb, color: color),
                      title: Text(
                        "Suffest a feature",
                        style: TextStyle(
                          //
                          color: color,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: color,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.star, color: color),
                      title: Text(
                        "Rate the app",
                        style: TextStyle(
                          //
                          color: color,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          //  Footer things
          Container(
            width: double.maxFinite,
            color: Colors.green[800],
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                //
                Text(
                  "University App 2026 | Built with",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "Contact us at: support@universityapp.com",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card socialNetwork(BuildContext context, url, image) {
    final color = Theme.of(context).colorScheme.secondary;
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 1,
      shadowColor: color,
      child: GestureDetector(
        onTap: () async {
          await launchUrl(Uri.parse(url));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //
          ),
          child: Image.network(image, color: color),
        ),
      ),
    );
  }
}
