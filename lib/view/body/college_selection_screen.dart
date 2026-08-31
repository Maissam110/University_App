import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:university/Model/new_model.dart';
import 'package:university/Provider/theme_provider.dart';
import 'package:university/route.dart';
import 'package:university/view/body/Services/firestore_service.dart';
import 'package:university/view/body/semester.dart';

class CollegeSelectionScreen extends ConsumerStatefulWidget {
  const CollegeSelectionScreen({super.key});

  @override
  ConsumerState<CollegeSelectionScreen> createState() =>
      _CollegeSelectionScreenState();
}

class _CollegeSelectionScreenState
    extends ConsumerState<CollegeSelectionScreen> {
  //  Firebase Service to fetch data

  final FirestoreService _firestoreService = FirestoreService();

  // Store Selected Course for each facluty

  Map<String, String?> selectedCourses = {};

  //
  @override
  Widget build(BuildContext context) {
    //  Watch the current theme mode
    final themeMode = ref.watch(themeNotifierProvider);
    //  Used to toggle theme
    final notifier = ref.read(themeNotifierProvider.notifier);
    // Check id the Theme is Dark
    final isDark = themeMode == ThemeMode.dark;
    //  Use Sceondary color for UI
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      // foregroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Select Your College",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: notifier.toggleTheme, // Toggle between light and dark
          child: Icon(
            isDark ? Icons.dark_mode : Icons.light_mode,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),

      //  In Bodies we have to fatch the faculties and their repective course form firebase
      body: FutureBuilder(
        future: _firestoreService.getFacultiesWithCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // show loading screen while data is loading
            return Center(child: CircularProgressIndicator(color: color));
          }
          if (snapshot.hasError) {
            //  show error message if fetcing fail
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: color),
              ),
            );
          }
          List<Faculty> faculties =
              snapshot.data ?? []; // Get data or empty list
          if (faculties.isEmpty) {
            // Show message if no data was found
            return Center(
              child: Text(
                "No Faculty Data Founded or Data Fetch Failed.",
                style: TextStyle(color: color),
              ),
            );
          }

          //  Display the list of faculties with dropdown to select courses if everythings perfect
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: faculties.length,
            itemBuilder: (context, index) {
              Faculty faculty = faculties[index];
              // initialized selected course for this faculty it not already set.
              selectedCourses.putIfAbsent(faculty.name, () => null);

              return Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  padding: EdgeInsets.only(right: 16, left: 16),

                  decoration: BoxDecoration(
                    border: Border.all(color: color.withAlpha(100), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton<String>(
                    dropdownColor: Theme.of(context).primaryColor,
                    icon: Icon(Icons.arrow_drop_down, color: color),
                    // Current selected course
                    value: selectedCourses[faculty.name],
                    // Remove the underline
                    underline: SizedBox(),
                    style: TextStyle(
                      color: color,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    // Expended dropdown to full width
                    isExpanded: true,
                    // Faculty name as an hint
                    hint: Text(faculty.name, style: TextStyle(color: color)),
                    items: faculty.course.map((Course course) {
                      // Create dropdown item for every course
                      return DropdownMenuItem<String>(
                        value: course.name,
                        child: Text(
                          course.name,
                          style: TextStyle(color: color),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (mounted && newValue != null) {
                        setState(() {
                          //Navigate to Semester Screen when a course is selected
                          Course selectedCourse = faculty.course.firstWhere(
                            (course) => course.name == newValue,
                          );
                          NavigationHelper.push(
                            context,
                            SemesterScreen(
                              faculty: faculty,
                              course: selectedCourse,
                            ),
                          );
                        });
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


//  if we rerstart the all again it will ask to login and display onboarding screen and splash screen

// now let's make it keep user login until logout.