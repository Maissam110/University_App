import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                    Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 1,
                      shadowColor: color,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
