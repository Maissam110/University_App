class Faculty {
  //  First we only have to required the name and td repective course
  final String name;
  final List<Course> course;
  //  Latitude, longtitude, rating, unversityImage and number are only to map the display the department location
  // final double latitude;
  // final double longitude;
  // final double rating;
  // final int number;
  // final String universityImage;

  Faculty({
    required this.name,

    required this.course,
    // required this.latitude,
    // required this.longitude,
    // required this.rating,
    // required this.number,
    // required this.universityImage,
  });
}

class Course {
  final String facultyName;
  final String name;
  final String id;
  final List<Semester> semesters;
  final List<Map<String, dynamic>> contacts;
  final List<Map<String, dynamic>> notification;
  final List<String> imageList;
  final List<String> feeStructure;

  Course({
    required this.name,
    required this.contacts,
    required this.imageList,
    required this.feeStructure,
    required this.notification,
    required this.facultyName,
    required this.id,
    required this.semesters,
  });
}

class Semester {
  final String name;
  final Map<String, dynamic> syllabus;
  final Map<String, dynamic> notes;
  final Map<String, dynamic> question;
  final List<Map<String, dynamic>> exam;

  final int order;

  Semester({
    required this.name,
    required this.syllabus,
    required this.notes,
    required this.question,
    required this.exam,
    required this.order,
  });
}
