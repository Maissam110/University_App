import 'package:flutter/material.dart';
import 'package:university/Model/new_model.dart';
import 'package:university/route.dart';
import 'package:university/view/body/Screens/Home/Administrative/fee_structure.dart';
import 'package:university/view/body/Screens/Widgets/my_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Administrative extends StatelessWidget {
  final Semester semester;
  final Course course;
  const Administrative({
    super.key,
    required this.semester,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      //
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text(semester.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //
            semester.exam.isNotEmpty
                ? ListView.builder(
                    //
                    shrinkWrap: true,
                    itemCount: semester.exam.length,
                    itemBuilder: (context, index) {
                      final exam = semester.exam[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          //
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                //
                                "For the ${exam['title']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                ),
                                onPressed: () async {
                                  final url = exam['fileUrl'];
                                  // if (url != null &&
                                  //     url.isNotEmpty &&
                                  //     await canLaunchUrl(Uri.parse(url))) {
                                  //   await canLaunchUrl(Uri.parse(url));
                                  // }
                                  if (url != null && url.isNotEmpty) {
                                    final Uri uri = Uri.parse(url);

                                    // Launch directly without requiring canLaunchUrl
                                    if (!await launchUrl(
                                      uri,
                                      mode: LaunchMode.externalApplication,
                                    )) {
                                      // Handle error if launch fails (e.g., show a Snackbar)
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Could not open the link',
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    String name = exam['title']
                                        .toString()
                                        .toLowerCase();
                                    String message;
                                    if (name.contains("exam form")) {
                                      message =
                                          '${exam['title']} is open within 15 days';
                                    } else if (name.contains("exam result")) {
                                      message =
                                          '${exam['title']} is publishing within 15 days';
                                    } else {
                                      message =
                                          '${exam['title']} is comming soon';
                                    }

                                    mySnackBar(message, context);
                                  }
                                },
                                child: Text(
                                  "Click Here",
                                  style: TextStyle(color: color),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox.shrink(),

            //
            // Fee Structure
            course.feeStructure.isNotEmpty
                ? Container(
                    //
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          //
                          "Fee Structure of ${course.name}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            //
                            NavigationHelper.push(
                              context,
                              FeeStructure(course: course),
                            );
                          },
                          child: Text(
                            "Click Here",
                            style: TextStyle(color: color),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
