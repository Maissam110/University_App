import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:university/Model/new_model.dart';
import 'package:university/route.dart';
import 'package:university/view/body/Screens/Home/Administrative/administrative.dart';
import 'package:university/view/body/Screens/Home/contact.dart';
import 'package:university/view/body/Screens/Home/developer.dart';
import 'package:university/view/body/Screens/Home/notic_board.dart';
import 'package:university/view/body/Screens/Widgets/common_card.dart';
import 'package:university/view/body/Screens/Widgets/my_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final Semester semester;
  final Course course;
  const HomeScreen({super.key, required this.semester, required this.course});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("${course.name} ${semester.name}"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              NavigationHelper.push(context, NoticBoard(course: course));
            },
            child: Stack(
              children: [
                Icon(Iconsax.notification_bing, size: 30),
                Positioned(
                  top: 2,
                  right: 4,
                  child: CircleAvatar(radius: 5, backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            SizedBox(
              height: 280,
              width: double.maxFinite,
              child: course.imageList.isNotEmpty
                  ? CarouselSlider(
                      items: course.imageList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                                errorBuilder: (context, error, stackTrace) =>
                                    Center(
                                      child: Text(
                                        "Image Failed to load",
                                        style: TextStyle(color: color),
                                      ),
                                    ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 280,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.82,
                      ),
                    )
                  : Center(
                      child: Text(
                        "No Image Available",
                        style: TextStyle(color: color),
                      ),
                    ),
            ),

            // List of available features in grid
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              primary: true,
              children: [
                CommonCard(
                  onTap: () {
                    NavigationHelper.push(
                      context,
                      ContactScreen(course: course),
                    );
                  },
                  title: "Contact",
                  imageofCard:
                      "https://static.vecteezy.com/system/resources/previews/055/740/131/non_2x/black-phone-call-icon-for-website-contact-us-icon-for-interface-vector.jpg",
                ),
                CommonCard(
                  title: "Syllabus",
                  imageofCard:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhaAIrWE3-wrKBITOtoXCjX4srjkPPNIK17EijxAzvCA&s=10",
                  onTap: () async {
                    final url = semester.syllabus['url'];
                    if (url != null &&
                        url.isNotEmpty &&
                        await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      mySnackBar("Syllabus Updating Soon", context);
                    }
                  },
                ),
                CommonCard(
                  title: "Notes",
                  imageofCard:
                      "https://static.vecteezy.com/system/resources/previews/039/207/792/non_2x/note-icon-design-template-in-white-background-free-vector.jpg",
                  onTap: () async {
                    final url = semester.notes['url'];
                    if (url != null &&
                        url.isNotEmpty &&
                        await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      mySnackBar("Notes Updating Soon", context);
                    }
                  },
                ),
                CommonCard(
                  title: "Question",
                  imageofCard:
                      "https://static.vecteezy.com/system/resources/previews/007/126/739/non_2x/question-mark-icon-free-vector.jpg",
                  onTap: () async {
                    final url = semester.question['url'];
                    if (url != null &&
                        url.isNotEmpty &&
                        await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      mySnackBar("Question Updating Soon", context);
                    }
                  },
                ),
                CommonCard(
                  onTap: () {
                    NavigationHelper.push(context, DeveloperScreen());
                  },
                  title: "Developer",
                  imageofCard:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQzjwgPUf6ifJTXQ4__aTSBn2MzHzGX33TdHbmbdJDrgw-CmUZf2KsWGqX&s=10",
                ),
                CommonCard(
                  onTap: () {
                    NavigationHelper.push(
                      context,
                      Administrative(semester: semester, course: course),
                    );
                  },
                  title: "Administrative",
                  imageofCard:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsy5BZ7JgRKlQMJxiKK7_7WNRz9qM3KP9aCeBodAAgn0BsAERUzIGctHU7&s=10",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
