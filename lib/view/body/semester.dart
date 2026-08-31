import 'package:flutter/material.dart';
import 'package:university/Model/new_model.dart';
import 'package:university/route.dart';
import 'package:university/view/body/Screens/Bottom%20Nav%20Bar/bottom_nav_bar_screen.dart';

class SemesterScreen extends StatelessWidget {
  final Course course;
  final Faculty faculty;
  const SemesterScreen({
    super.key,
    required this.course,
    required this.faculty,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(course.name),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),

      // Body of the app
      body: course.semesters.isEmpty
          ? Center(
              child: Text(
                "No Semester available for tis course",
                style: TextStyle(color: color),
              ),
            )
          : ListView.builder(
              itemCount: course.semesters.length,
              itemBuilder: (context, index) {
                final semester = course.semesters[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          BottomNavBarScreen(
                            semester: semester,
                            course: course,
                            faculty: faculty,
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          semester.name,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    Divider(color: color.withAlpha(100)),
                  ],
                );
              },
            ),
    );
  }
}
