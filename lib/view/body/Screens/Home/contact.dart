import 'package:flutter/material.dart';
import 'package:university/Model/new_model.dart';

class ContactScreen extends StatelessWidget {
  final Course course;
  const ContactScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Contact"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),

      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: course.contacts.isNotEmpty
            ? ListView.builder(
                itemCount: course.contacts.length,
                itemBuilder: (context, index) {
                  final contact = course.contacts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name: ${contact['name'] ?? "Unknown"}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: color,
                            ),
                          ),
                          if (course.contacts[index] == course.contacts[0])
                            Text(
                              " (HOD)",
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                        ],
                      ),
                      if (contact['address'] != null &&
                          contact['address'].isNotEmpty)
                        Text(
                          "Address: ${contact['address'] ?? "N/A"}",
                          style: TextStyle(color: color),
                        ),
                      Text(
                        "Contact: ${contact['contact'] ?? "N/A"}",
                        style: TextStyle(color: color),
                      ),
                      Text(
                        "Email: ${contact['email'] ?? "N/A"}",
                        style: TextStyle(color: color),
                      ),
                      Divider(color: color),
                    ],
                  );
                },
              )
            : Center(
                child: Text(
                  "No Contacts Available",
                  style: TextStyle(color: color),
                ),
              ),
      ),
    );
  }
}
