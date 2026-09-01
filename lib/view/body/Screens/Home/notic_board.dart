import 'package:flutter/material.dart';
import 'package:university/Model/new_model.dart';

class NoticBoard extends StatelessWidget {
  final Course course;
  const NoticBoard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Notic Board of ${course.name}"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),

      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: course.notification.isNotEmpty
            ? ListView.builder(
                itemCount: course.notification.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final notic = course.notification[index];
                  final image = notic['image'];
                  return Card(
                    elevation: 1,
                    shadowColor: color,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Optional Image
                        if (image is String && image.isNotEmpty)
                          //
                          ClipRRect(
                            //
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              image,
                              height: 300,
                              width: double.maxFinite,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        SizedBox(height: 10),
                        // Title and Description and mandatory
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            notic['title'] ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: color,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            notic['subtitle'] ?? "",
                            style: TextStyle(height: 1.5, color: color),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                notic['date'] ?? "",
                                style: TextStyle(height: 1.5, color: color),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height:0),
                      ],
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "No Notifications Available",
                  style: TextStyle(color: color),
                ),
              ),
      ),
    );
  }
}
