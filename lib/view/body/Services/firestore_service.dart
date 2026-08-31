import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university/Model/new_model.dart';

class FirestoreService {
  //  Refector to the top level UniversityAppData collection
  final CollectionReference facultiesCollection = FirebaseFirestore.instance
      .collection('UniversityAppData');

  // Fetch all faculties along with their course and semester related data
  Future<List<Faculty>> getFacultiesWithCourses() async {
    List<Faculty> faculties = []; // List to store all faculties
    try {
      // Fetch all data from UniversityAppData

      QuerySnapshot facultySnapshot = await facultiesCollection.get();

      for (var facultyDoc in facultySnapshot.docs) {
        // Extract faculty level data
        String facultyName = facultyDoc.get('name') ?? "N/A";
        //  We will add remaining field later

        //  Fatch all course under this faculty
        QuerySnapshot courseSnapshop = await facultyDoc.reference
            .collection('Course')
            .get();
        List<Course> courses =
            []; // List to store all courses for this facuilty
        for (var courseDoc in courseSnapshop.docs) {
          // initialized fields with default empty values
          List<Map<String, dynamic>> contacts = [];
          List<Map<String, dynamic>> notification = [];
          List<String> imageList = [];
          List<String> feeStructure = [];

          //  Try to extract "Contacts" field

          try {
            var contactListData = courseDoc.get("contacts");
            if (contactListData != null && contactListData is List) {
              contacts = List<Map<String, dynamic>>.from(contactListData);
            }
          } catch (e) {
            // ignore: avoid_print
            print("Error fetching contact data: $e");
          }

          //  Try to extract "ImageList" field

          try {
            var imageListData = courseDoc.get("imageList");
            if (imageListData != null && imageListData is List) {
              imageList = List<String>.from(imageListData);
            }
          } catch (e) {
            // ignore: avoid_print
            print("Error fetching imageList field: $e");
          }

          //  Fetch semester under this course ordered by the order field
          QuerySnapshot semesterSnapshop = await courseDoc.reference
              .collection('Semesters')
              // To dislay the semester in order, we have to use the orderBy function
              .orderBy('order', descending: false)
              .get();
          List<Semester> semesters = []; // List to hold semester data

          for (var semDoc in semesterSnapshop.docs) {
            //Initiliazed the semester related field
            Map<String, dynamic> syllabus = {};
            Map<String, dynamic> notes = {};
            Map<String, dynamic> question = {};
            List<Map<String, dynamic>> exam = [];

            int order = 0;

            //  Try to extract "Syllabus" field

            try {
              var syllabusData = semDoc.get("syllabus");
              if (syllabusData != null && syllabusData is Map) {
                syllabus = Map<String, dynamic>.from(syllabusData);
              }
            } catch (e) {
              // ignore: avoid_print
              print("Error fetching syllabus data: $e");
            }
            //  Try to extract "Notes" field

            try {
              var notesData = semDoc.get("notes");
              if (notesData != null && notesData is Map) {
                notes = Map<String, dynamic>.from(notesData);
              }
            } catch (e) {
              // ignore: avoid_print
              print("Error fetching notes data: $e");
            }
            //  Try to extract "Question" field

            try {
              var questionData = semDoc.get("question");
              if (questionData != null && questionData is Map) {
                question = Map<String, dynamic>.from(questionData);
              }
            } catch (e) {
              // ignore: avoid_print
              print("Error fetching question data: $e");
            }

            //  Add Semester to the list
            semesters.add(
              Semester(
                name: semDoc.get('name') ?? "N/A",
                syllabus: syllabus,
                notes: notes,
                question: question,
                exam: exam,
                order: order,
              ),
            );
          }
          //  add course to the course list
          courses.add(
            //
            Course(
              name: courseDoc.get('name') ?? "N/A ",
              contacts: contacts,
              imageList: imageList,
              feeStructure: feeStructure,
              notification: notification,
              facultyName: facultyName,
              id: courseDoc.id,
              semesters: semesters,
            ),
          );
        }
        // add the faculty with its course list to the faculties list
        faculties.add(Faculty(name: facultyName, course: courses));
      }
    } catch (e) {
      e.toString();
    }
    // Return the Faculty contructed faculty list
    return faculties;
  }
}
