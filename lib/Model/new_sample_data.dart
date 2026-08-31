// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';

// // // class SemesterData {
// // //   final String name;
// // //   final Map<String, String> syllabus;
// // //   final Map<String, String> notes;
// // //   final Map<String, String> question;
// // //   final List<Map<String, String>> exam;

// // //   final int order;

// // //   SemesterData({
// // //     required this.name,
// // //     required this.syllabus,
// // //     required this.notes,
// // //     required this.question,
// // //     required this.exam,
// // //     required this.order,
// // //   });

// // //   Map<String, dynamic> toMap() {
// // //     return {
// // //       'name': name,
// // //       'syllabus': syllabus,
// // //       'notes': notes,
// // //       'question': question,
// // //       'exam': exam,
// // //       'order': order,
// // //     };
// // //   }
// // // }

// // // class Course {
// // //   final String name;
// // //   final int semesterCount;
// // //   final List<Map<String, String>> contacts;
// // //   final List<Map<String, dynamic>> notification;
// // //   final List<String> imageList;
// // //   final List<String> feeStructure;

// // //   Course({
// // //     required this.name,
// // //     required this.semesterCount,
// // //     required this.contacts,
// // //     required this.imageList,
// // //     required this.feeStructure,
// // //     required this.notification,
// // //   });

// // //   Map<String, dynamic> toMap() {
// // //     return {
// // //       'name': name,
// // //       'contacts': contacts,
// // //       'notification': notification,
// // //       'imageList': imageList,
// // //       'feeStructure': feeStructure,
// // //     };
// // //   }
// // // }

// // // // Model For Faculty

// // // class Faculty {
// // //   final String name;
// // //   final double latitude;
// // //   final double longitude;
// // //   final double rating;
// // //   final int number;
// // //   final String universityImage;
// // //   final List<Course> course;

// // //   Faculty({
// // //     required this.name,
// // //     required this.latitude,
// // //     required this.longitude,
// // //     required this.rating,
// // //     required this.number,
// // //     required this.universityImage,
// // //     required this.course,
// // //   });
// // // }

// // // //Semester names list with order

// // // final List<Map<String, dynamic>> semesterLabels = [
// // //   {'name': 'First Semester', 'order': '1'},
// // //   {'name': 'Second Semester', 'order': '2'},
// // //   {'name': 'Third Semester', 'order': '3'},
// // //   {'name': 'Fourth Semester', 'order': '4'},
// // //   {'name': 'Fifth Semester', 'order': '5'},
// // //   {'name': 'Sixth Semester', 'order': '6'},
// // //   {'name': 'Seventh Semester', 'order': '7'},
// // //   {'name': 'Eighth Semester', 'order': '8'},
// // //   {'name': 'Ninth Semester', 'order': '9'},
// // //   {'name': 'Tenth Semester', 'order': '10'},
// // // ];

// // // // Initial notification is empty
// // // Map<String, List<Map<String, String>>> defaultNotification = {
// // //   'default': [
// // //     {
// // //       'title': 'Welcome',
// // //       'subtitle': 'Thanks for using this app for your bright Future',
// // //       'image':
// // //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0eyqTTXYpLVhj6SyFb8an1ujCkrIQuNNuSlrsZha-w&s',
// // //     },
// // //   ],
// // // };

// // // //  Smaple Data for different Courses
// // // Map<String, List<Map<String, String>>> courseSpecificContacts = {
// // //   'BS Civil': [
// // //     {
// // //       'name': 'Civil Kumar',
// // //       'address': 'SKT',
// // //       'contact': '98000000',
// // //       'email': 'civil@example.com',
// // //     },
// // //     {
// // //       'name': 'Ram Sherista',
// // //       'address': 'khatmadu',
// // //       'contact': '98000000',
// // //       'email': 'ram@example.com',
// // //     },
// // //     {
// // //       'name': 'Ali',
// // //       'address': 'Sialkot',
// // //       'contact': '98000000',
// // //       'email': 'ali@example.com',
// // //     },
// // //   ],
// // //   'BS Computer': [
// // //     {
// // //       'name': 'Civil Kumar',
// // //       'address': 'SKT',
// // //       'contact': '98000000',
// // //       'email': 'civil@example.com',
// // //     },
// // //     {
// // //       'name': 'Ram Sherista',
// // //       'address': 'khatmadu',
// // //       'contact': '98000000',
// // //       'email': 'ram@example.com',
// // //     },
// // //     {
// // //       'name': 'Ali',
// // //       'address': 'Sialkot',
// // //       'contact': '98000000',
// // //       'email': 'ali@example.com',
// // //     },
// // //   ],
// // //   'default': [
// // //     {
// // //       'name': 'Civil Kumar',
// // //       'address': 'SKT',
// // //       'contact': '98000000',
// // //       'email': 'civil@example.com',
// // //     },
// // //     {
// // //       'name': 'Ram Sherista',
// // //       'address': 'khatmadu',
// // //       'contact': '98000000',
// // //       'email': 'ram@example.com',
// // //     },
// // //     {
// // //       'name': 'Ali',
// // //       'address': 'Sialkot',
// // //       'contact': '98000000',
// // //       'email': 'ali@example.com',
// // //     },
// // //   ],
// // // };

// // // Map<String, List<String>> courseSpecificImages = {
// // //   'BS Civil': [
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJu5AuHBXAJQvPNlMeWXwzwp1C4xaORqBpqLy3bG157A&s=10',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREgcbSq0mH619ckIPQtm-v9ZfFn_zrcbpWB2ZG-0IXbQ&s=10',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5W4fDPb9Cp8lOydO0_4GznAXnDbafQ9NVNohVKQ51mw&s=10',
// // //     // 3 Images
// // //   ],
// // //   'BS Computer': [
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVBSBbCh5TGC3_I_k2gnidKkqRWy1Was56JSG6sgHCSQ&s=10',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC419YNLNoMlVD9UEzQbpVPLFnxwy7xSdbrMFJ4holrAcQeIO_OUa7HCfD&s=10',
// // //     // 2 Images
// // //   ],
// // //   'BS Hydropower': [
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeIFnf-oYy7R6CJu0m6e361LPuOdRo833Kl19pmnKEnA&s=10',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS24XTSjAkkfCzLjuEW3ag5R4NjtQ2GpXfUlqfvH7OEg&s',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMxz9e3DmMayZPu2bXuB7sryKYz0tON06MBAhWj83Iig&s=10',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIqYqrrOc67sdlHlJ9tQFZJGHBeJd_8OI0EQZiLQ_aDA&s=10',
// // //     // 4 Images
// // //   ],
// // //   'default': [
// // //     // 2 Images
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBcUVOzYlASzI1BafXHpOWUhe70E1keUBh1bcVxM8fJg&s=10',
// // //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkqcoyYt-BFtJE_QLBf4a1OS_BFRsoRfQfsH3pGcD7Ng&s=10',
// // //   ],
// // // };

// // // //Upload Structure To FireStore
// // // Future<void> uploadFirestoreStructure() async {
// // //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
// // //   final faculties = [
// // //     Faculty(
// // //       latitude: 28.53871894035744,
// // //       longitude: 81.62611371588851,
// // //       // 1 Image
// // //       universityImage: '',
// // //       rating: 4.5,
// // //       number: 20,
// // //       name: 'Engineering',
// // //       course: [
// // //         Course(
// // //           name: 'BS Civil',
// // //           semesterCount: 8,
// // //           contacts:
// // //               courseSpecificContacts['BS Civil'] ??
// // //               courseSpecificContacts['default']!,
// // //           imageList:
// // //               courseSpecificImages['BS Civil'] ??
// // //               courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS Computer',
// // //           semesterCount: 8,
// // //           contacts:
// // //               courseSpecificContacts['BS Computer'] ??
// // //               courseSpecificContacts['default']!,
// // //           imageList:
// // //               courseSpecificImages['BS Computer'] ??
// // //               courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS Hydropower',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList:
// // //               courseSpecificImages['BS Hydropower'] ??
// // //               courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'MSc Construction Management',
// // //           semesterCount: 4,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 70000',
// // //             'Semester 2 : NPR 60000',
// // //             'Semester 3 : NPR 60000',
// // //             'Semester 4 : NPR 60000',

// // //             'Total : NPR 250000',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'MSc Structural Engineering',
// // //           semesterCount: 4,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 70000',
// // //             'Semester 2 : NPR 60000',
// // //             'Semester 3 : NPR 60000',
// // //             'Semester 4 : NPR 60000',

// // //             'Total : NPR 250000',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'MSc Machanical Engineering',
// // //           semesterCount: 4,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 70000',
// // //             'Semester 2 : NPR 60000',
// // //             'Semester 3 : NPR 60000',
// // //             'Semester 4 : NPR 60000',

// // //             'Total : NPR 250000',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'MBA Spring',
// // //           semesterCount: 4,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 70000',
// // //             'Semester 2 : NPR 60000',
// // //             'Semester 3 : NPR 60000',
// // //             'Semester 4 : NPR 60000',

// // //             'Total : NPR 250000',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'MBS',
// // //           semesterCount: 4,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 70000',
// // //             'Semester 2 : NPR 60000',
// // //             'Semester 3 : NPR 60000',
// // //             'Semester 4 : NPR 60000',

// // //             'Total : NPR 250000',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BBS',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BHM',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BTTM',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS IT',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BBA',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS English',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS English',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS Information Tecnology',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'MBA Fail',
// // //           semesterCount: 4,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 70000',
// // //             'Semester 2 : NPR 60000',
// // //             'Semester 3 : NPR 60000',
// // //             'Semester 4 : NPR 60000',

// // //             'Total : NPR 250000',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS Math',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS Urdu',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //         Course(
// // //           name: 'BS Islamiyat',
// // //           semesterCount: 8,
// // //           contacts: courseSpecificContacts['default']!,
// // //           imageList: courseSpecificImages['default']!,
// // //           feeStructure: [
// // //             'Semester 1 : NPR 68450',
// // //             'Semester 2 : NPR 58450',
// // //             'Semester 3 : NPR 58450',
// // //             'Semester 4 : NPR 58450',
// // //             'Semester 5 : NPR 58450',
// // //             'Semester 6 : NPR 58450',
// // //             'Semester 7 : NPR 58450',
// // //             'Semester 8 : NPR 58450',
// // //             'Total : NPR 477600',
// // //           ],
// // //           notification: defaultNotification['default']!,
// // //         ),
// // //       ],
// // //     ),
// // //   ];

// // //   for (final faculty in faculties) {
// // //     final facultyDoc = firestore
// // //         .collection('UniversityAppData')
// // //         .doc(faculty.name);
// // //     await facultyDoc.set({
// // //       'name': faculty.name,
// // //       'latitude': faculty.latitude,
// // //       'longitude': faculty.longitude,
// // //       'rating': faculty.rating,
// // //       'number': faculty.number,
// // //       'universityImage': faculty.universityImage,
// // //     });
// // //     for (final course in faculty.course) {
// // //       final courseDoc = facultyDoc.collection('Course').doc(course.name);
// // //       await courseDoc.set(course.toMap());

// // //       for (int i = 0; i < course.semesterCount; i++) {
// // //         // Extract semester name and order, then create SemesterData and add to appropriate collection
// // //         final semName = semesterLabels[i]['name'] as String;
// // //         final semOrder = semesterLabels[i]['order'] as int;
// // //       }
// // //     }
// // //   }
// // // }

// // // class UploadScreen extends StatelessWidget {
// // //   const UploadScreen({super.key});
// // //   Future<void> _handleUpload(BuildContext context) async {
// // //     try {
// // //       await uploadFirestoreStructure();
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text('Upload Data Sucessfully!')));
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text('Error uploading data : $e')));
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Upload Faculty Data')),
// // //       body: Center(
// // //         child: ElevatedButton.icon(
// // //           onPressed: () => _handleUpload(context),
// // //           label: Text("Upload to firebase"),
// // //           icon: Icon(Icons.upload_file),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // class SemesterData {
// //   final String name;
// //   final Map<String, String> syllabus;
// //   final Map<String, String> notes;
// //   final Map<String, String> question;
// //   final List<Map<String, String>> exam;
// //   final int order;

// //   SemesterData({
// //     required this.name,
// //     required this.syllabus,
// //     required this.notes,
// //     required this.question,
// //     required this.exam,
// //     required this.order,
// //   });

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'name': name,
// //       'syllabus': syllabus,
// //       'notes': notes,
// //       'question': question,
// //       'exam': exam,
// //       'order': order,
// //     };
// //   }
// // }

// // class Course {
// //   final String name;
// //   final int semesterCount;
// //   final List<Map<String, String>> contacts;
// //   final List<Map<String, dynamic>> notification;
// //   final List<String> imageList;
// //   final List<String> feeStructure;

// //   Course({
// //     required this.name,
// //     required this.semesterCount,
// //     required this.contacts,
// //     required this.imageList,
// //     required this.feeStructure,
// //     required this.notification,
// //   });

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'name': name,
// //       'semesterCount': semesterCount,
// //       'contacts': contacts,
// //       'notification': notification,
// //       'imageList': imageList,
// //       'feeStructure': feeStructure,
// //     };
// //   }
// // }

// // class Faculty {
// //   final String name;
// //   final double latitude;
// //   final double longitude;
// //   final double rating;
// //   final int number;
// //   final String universityImage;
// //   final List<Course> course;

// //   Faculty({
// //     required this.name,
// //     required this.latitude,
// //     required this.longitude,
// //     required this.rating,
// //     required this.number,
// //     required this.universityImage,
// //     required this.course,
// //   });
// // }

// // // Fixed: Converted string order values ('1') to integers (1) to prevent dynamic type-casting errors
// // final List<Map<String, dynamic>> semesterLabels = [
// //   {'name': 'First Semester', 'order': 1},
// //   {'name': 'Second Semester', 'order': 2},
// //   {'name': 'Third Semester', 'order': 3},
// //   {'name': 'Fourth Semester', 'order': 4},
// //   {'name': 'Fifth Semester', 'order': 5},
// //   {'name': 'Sixth Semester', 'order': 6},
// //   {'name': 'Seventh Semester', 'order': 7},
// //   {'name': 'Eighth Semester', 'order': 8},
// //   {'name': 'Ninth Semester', 'order': 9},
// //   {'name': 'Tenth Semester', 'order': 10},
// // ];

// // Map<String, List<Map<String, String>>> defaultNotification = {
// //   'default': [
// //     {
// //       'title': 'Welcome',
// //       'subtitle': 'Thanks for using this app for your bright Future',
// //       'image':
// //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0eyqTTXYpLVhj6SyFb8an1ujCkrIQuNNuSlrsZha-w&s',
// //     },
// //   ],
// // };

// // Map<String, List<Map<String, String>>> courseSpecificContacts = {
// //   'default': [
// //     {
// //       'name': 'Civil Kumar',
// //       'address': 'SKT',
// //       'contact': '98000000',
// //       'email': 'civil@example.com',
// //     },
// //     {
// //       'name': 'Ram Sherista',
// //       'address': 'khatmadu',
// //       'contact': '98000000',
// //       'email': 'ram@example.com',
// //     },
// //     {
// //       'name': 'Ali',
// //       'address': 'Sialkot',
// //       'contact': '98000000',
// //       'email': 'ali@example.com',
// //     },
// //   ],
// // };

// // Map<String, List<String>> courseSpecificImages = {
// //   'BS Civil': [
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJu5AuHBXAJQvPNlMeWXwzwp1C4xaORqBpqLy3bG157A&s=10',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREgcbSq0mH619ckIPQtm-v9ZfFn_zrcbpWB2ZG-0IXbQ&s=10',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5W4fDPb9Cp8lOydO0_4GznAXnDbafQ9NVNohVKQ51mw&s=10',
// //   ],
// //   'BS Computer': [
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVBSBbCh5TGC3_I_k2gnidKkqRWy1Was56JSG6sgHCSQ&s=10',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC419YNLNoMlVD9UEzQbpVPLFnxwy7xSdbrMFJ4holrAcQeIO_OUa7HCfD&s=10',
// //   ],
// //   'BS Hydropower': [
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeIFnf-oYy7R6CJu0m6e361LPuOdRo833Kl19pmnKEnA&s=10',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS24XTSjAkkfCzLjuEW3ag5R4NjtQ2GpXfUlqfvH7OEg&s',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMxz9e3DmMayZPu2bXuB7sryKYz0tON06MBAhWj83Iig&s=10',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIqYqrrOc67sdlHlJ9tQFZJGHBeJd_8OI0EQZiLQ_aDA&s=10',
// //   ],
// //   'default': [
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBcUVOzYlASzI1BafXHpOWUhe70E1keUBh1bcVxM8fJg&s=10',
// //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkqcoyYt-BFtJE_QLBf4a1OS_BFRsoRfQfsH3pGcD7Ng&s=10',
// //   ],
// // };

// // Future<void> uploadFirestoreStructure() async {
// //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
// //   final faculties = [
// //     Faculty(
// //       latitude: 28.53871894035744,
// //       longitude: 81.62611371588851,
// //       universityImage: '',
// //       rating: 4.5,
// //       number: 20,
// //       name: 'Engineering',
// //       course: [
// //         Course(
// //           name: 'BS Civil',
// //           semesterCount: 8,
// //           contacts:
// //               courseSpecificContacts['BS Civil'] ??
// //               courseSpecificContacts['default']!,
// //           imageList:
// //               courseSpecificImages['BS Civil'] ??
// //               courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS Computer',
// //           semesterCount: 8,
// //           contacts:
// //               courseSpecificContacts['BS Computer'] ??
// //               courseSpecificContacts['default']!,
// //           imageList:
// //               courseSpecificImages['BS Computer'] ??
// //               courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS Hydropower',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList:
// //               courseSpecificImages['BS Hydropower'] ??
// //               courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'MSc Construction Management',
// //           semesterCount: 4,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 70000',
// //             'Semester 2 : NPR 60000',
// //             'Semester 3 : NPR 60000',
// //             'Semester 4 : NPR 60000',
// //             'Total : NPR 250000',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'MSc Structural Engineering',
// //           semesterCount: 4,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 70000',
// //             'Semester 2 : NPR 60000',
// //             'Semester 3 : NPR 60000',
// //             'Semester 4 : NPR 60000',
// //             'Total : NPR 250000',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'MSc Mechanical Engineering',
// //           semesterCount: 4,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 70000',
// //             'Semester 2 : NPR 60000',
// //             'Semester 3 : NPR 60000',
// //             'Semester 4 : NPR 60000',
// //             'Total : NPR 250000',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'MBA Spring',
// //           semesterCount: 4,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 70000',
// //             'Semester 2 : NPR 60000',
// //             'Semester 3 : NPR 60000',
// //             'Semester 4 : NPR 60000',
// //             'Total : NPR 250000',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'MBS',
// //           semesterCount: 4,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 70000',
// //             'Semester 2 : NPR 60000',
// //             'Semester 3 : NPR 60000',
// //             'Semester 4 : NPR 60000',
// //             'Total : NPR 250000',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BBS',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BHM',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BTTM',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS IT',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BBA',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS English',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS Math',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS Urdu',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //         Course(
// //           name: 'BS Islamiyat',
// //           semesterCount: 8,
// //           contacts: courseSpecificContacts['default']!,
// //           imageList: courseSpecificImages['default']!,
// //           feeStructure: [
// //             'Semester 1 : NPR 68450',
// //             'Semester 2 : NPR 58450',
// //             'Semester 3 : NPR 58450',
// //             'Semester 4 : NPR 58450',
// //             'Semester 5 : NPR 58450',
// //             'Semester 6 : NPR 58450',
// //             'Semester 7 : NPR 58450',
// //             'Semester 8 : NPR 58450',
// //             'Total : NPR 477600',
// //           ],
// //           notification: defaultNotification['default']!,
// //         ),
// //       ],
// //     ),
// //   ];

// //   for (final faculty in faculties) {
// //     final facultyDoc = firestore
// //         .collection('UniversityAppData')
// //         .doc(faculty.name);

// //     await facultyDoc.set({
// //       'name': faculty.name,
// //       'latitude': faculty.latitude,
// //       'longitude': faculty.longitude,
// //       'rating': faculty.rating,
// //       'number': faculty.number,
// //       'universityImage': faculty.universityImage,
// //     });

// //     for (final course in faculty.course) {
// //       final courseDoc = facultyDoc.collection('Course').doc(course.name);
// //       await courseDoc.set(course.toMap());

// //       for (int i = 0; i < course.semesterCount; i++) {
// //         final semName = semesterLabels[i]['name'] as String;
// //         final semOrder = semesterLabels[i]['order'] as int;

// //         final semesterData = SemesterData(
// //           name: semName,
// //           syllabus: {},
// //           notes: {},
// //           question: {},
// //           exam: [],
// //           order: semOrder,
// //         );

// //         // Upload semester document to nested collection:
// //         // UniversityAppData -> {Faculty} -> Course -> {Course} -> Semesters -> {Semester Name}
// //         await courseDoc
// //             .collection('Semesters')
// //             .doc(semName)
// //             .set(semesterData.toMap());
// //       }
// //     }
// //   }
// // }

// // class UploadScreen extends StatelessWidget {
// //   const UploadScreen({super.key});

// //   Future<void> _handleUpload(BuildContext context) async {
// //     try {
// //       await uploadFirestoreStructure();
// //       if (context.mounted) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Upload Data Successfully!')),
// //         );
// //       }
// //     } catch (e) {
// //       if (context.mounted) {
// //         ScaffoldMessenger.of(
// //           context,
// //         ).showSnackBar(SnackBar(content: Text('Error uploading data: $e')));
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Upload Faculty Data')),
// //       body: Center(
// //         child: ElevatedButton.icon(
// //           onPressed: () => _handleUpload(context),
// //           label: const Text("Upload to firebase"),
// //           icon: const Icon(Icons.upload_file),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class SemesterData {
//   final String name;
//   final Map<String, String> syllabus;
//   final Map<String, String> notes;
//   final Map<String, String> question;
//   final List<Map<String, String>> exam;
//   final int order;

//   SemesterData({
//     required this.name,
//     required this.syllabus,
//     required this.notes,
//     required this.question,
//     required this.exam,
//     required this.order,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'syllabus': syllabus,
//       'notes': notes,
//       'question': question,
//       'exam': exam,
//       'order': order,
//     };
//   }
// }

// class Course {
//   final String name;
//   final int semesterCount;
//   final List<Map<String, String>> contacts;
//   final List<Map<String, dynamic>> notification;
//   final List<String> imageList;
//   final List<String> feeStructure;

//   Course({
//     required this.name,
//     required this.semesterCount,
//     required this.contacts,
//     required this.imageList,
//     required this.feeStructure,
//     required this.notification,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'semesterCount': semesterCount,
//       'contacts': contacts,
//       'notification': notification,
//       'imageList': imageList,
//       'feeStructure': feeStructure,
//     };
//   }
// }

// class Faculty {
//   final String name;
//   final double latitude;
//   final double longitude;
//   final double rating;
//   final int number;
//   final String universityImage;
//   final List<Course> course;

//   Faculty({
//     required this.name,
//     required this.latitude,
//     required this.longitude,
//     required this.rating,
//     required this.number,
//     required this.universityImage,
//     required this.course,
//   });
// }

// final List<Map<String, dynamic>> semesterLabels = [
//   {'name': 'First Semester', 'order': 1},
//   {'name': 'Second Semester', 'order': 2},
//   {'name': 'Third Semester', 'order': 3},
//   {'name': 'Fourth Semester', 'order': 4},
//   {'name': 'Fifth Semester', 'order': 5},
//   {'name': 'Sixth Semester', 'order': 6},
//   {'name': 'Seventh Semester', 'order': 7},
//   {'name': 'Eighth Semester', 'order': 8},
//   {'name': 'Ninth Semester', 'order': 9},
//   {'name': 'Tenth Semester', 'order': 10},
// ];

// Map<String, List<Map<String, String>>> defaultNotification = {
//   'default': [
//     {
//       'title': 'Welcome',
//       'subtitle': 'Thanks for using this app for your bright Future',
//       'image':
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0eyqTTXYpLVhj6SyFb8an1ujCkrIQuNNuSlrsZha-w&s',
//     },
//   ],
// };

// Map<String, List<Map<String, String>>> courseSpecificContacts = {
//   'default': [
//     {
//       'name': 'Civil Kumar',
//       'address': 'SKT',
//       'contact': '98000000',
//       'email': 'civil@example.com',
//     },
//     {
//       'name': 'Ram Sherista',
//       'address': 'khatmadu',
//       'contact': '98000000',
//       'email': 'ram@example.com',
//     },
//     {
//       'name': 'Ali',
//       'address': 'Sialkot',
//       'contact': '98000000',
//       'email': 'ali@example.com',
//     },
//   ],
// };

// Map<String, List<String>> courseSpecificImages = {
//   'BS Civil': [
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJu5AuHBXAJQvPNlMeWXwzwp1C4xaORqBpqLy3bG157A&s=10',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREgcbSq0mH619ckIPQtm-v9ZfFn_zrcbpWB2ZG-0IXbQ&s=10',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5W4fDPb9Cp8lOydO0_4GznAXnDbafQ9NVNohVKQ51mw&s=10',
//   ],
//   'BS Computer': [
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVBSBbCh5TGC3_I_k2gnidKkqRWy1Was56JSG6sgHCSQ&s=10',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC419YNLNoMlVD9UEzQbpVPLFnxwy7xSdbrMFJ4holrAcQeIO_OUa7HCfD&s=10',
//   ],
//   'BS Hydropower': [
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeIFnf-oYy7R6CJu0m6e361LPuOdRo833Kl19pmnKEnA&s=10',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS24XTSjAkkfCzLjuEW3ag5R4NjtQ2GpXfUlqfvH7OEg&s',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMxz9e3DmMayZPu2bXuB7sryKYz0tON06MBAhWj83Iig&s=10',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIqYqrrOc67sdlHlJ9tQFZJGHBeJd_8OI0EQZiLQ_aDA&s=10',
//   ],
//   'default': [
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBcUVOzYlASzI1BafXHpOWUhe70E1keUBh1bcVxM8fJg&s=10',
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkqcoyYt-BFtJE_QLBf4a1OS_BFRsoRfQfsH3pGcD7Ng&s=10',
//   ],
// };

// List<String> getStandardUgFee() => [
//   'Semester 1 : NPR 68450',
//   'Semester 2 : NPR 58450',
//   'Semester 3 : NPR 58450',
//   'Semester 4 : NPR 58450',
//   'Semester 5 : NPR 58450',
//   'Semester 6 : NPR 58450',
//   'Semester 7 : NPR 58450',
//   'Semester 8 : NPR 58450',
//   'Total : NPR 477600',
// ];

// List<String> getStandardPgFee() => [
//   'Semester 1 : NPR 70000',
//   'Semester 2 : NPR 60000',
//   'Semester 3 : NPR 60000',
//   'Semester 4 : NPR 60000',
//   'Total : NPR 250000',
// ];

// List<String> getTenSemesterFee() => [
//   'Semester 1 : NPR 68450',
//   'Semester 2 : NPR 58450',
//   'Semester 3 : NPR 58450',
//   'Semester 4 : NPR 58450',
//   'Semester 5 : NPR 58450',
//   'Semester 6 : NPR 58450',
//   'Semester 7 : NPR 58450',
//   'Semester 8 : NPR 58450',
//   'Semester 9 : NPR 58450',
//   'Semester 10 : NPR 58450',
//   'Total : NPR 594500',
// ];

// List<String> getSixSemesterFee() => [
//   'Semester 1 : NPR 68450',
//   'Semester 2 : NPR 58450',
//   'Semester 3 : NPR 58450',
//   'Semester 4 : NPR 58450',
//   'Semester 5 : NPR 58450',
//   'Semester 6 : NPR 58450',
//   'Total : NPR 360700',
// ];

// Future<void> uploadFirestoreStructure() async {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   final faculties = [
//     // 1. Engineering & Technology
//     Faculty(
//       name: 'Engineering & Technology',
//       latitude: 28.53871894035744,
//       longitude: 81.62611371588851,
//       universityImage: '',
//       rating: 4.6,
//       number: 101,
//       course: [
//         Course(
//           name: 'BS Civil',
//           semesterCount: 8,
//           contacts:
//               courseSpecificContacts['BS Civil'] ??
//               courseSpecificContacts['default']!,
//           imageList:
//               courseSpecificImages['BS Civil'] ??
//               courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BS Hydropower',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList:
//               courseSpecificImages['BS Hydropower'] ??
//               courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'MSc Construction Management',
//           semesterCount: 4,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardPgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'MSc Structural Engineering',
//           semesterCount: 4,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardPgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'MSc Mechanical Engineering',
//           semesterCount: 4,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardPgFee(),
//           notification: defaultNotification['default']!,
//         ),
//       ],
//     ),

//     // 2. Computer Science & Information Technology
//     Faculty(
//       name: 'Computer Science & IT',
//       latitude: 28.53900000000000,
//       longitude: 81.62700000000000,
//       universityImage: '',
//       rating: 4.8,
//       number: 102,
//       course: [
//         Course(
//           name: 'BS Computer Science',
//           semesterCount: 8,
//           contacts:
//               courseSpecificContacts['BS Computer'] ??
//               courseSpecificContacts['default']!,
//           imageList:
//               courseSpecificImages['BS Computer'] ??
//               courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BS Information Technology',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//       ],
//     ),

//     // 3. Management Studies
//     Faculty(
//       name: 'Management Studies',
//       latitude: 28.53700000000000,
//       longitude: 81.62500000000000,
//       universityImage: '',
//       rating: 4.4,
//       number: 103,
//       course: [
//         Course(
//           name: 'BBA',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BBS',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BHM',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BTTM',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'MBA Spring',
//           semesterCount: 4,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardPgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'MBS',
//           semesterCount: 4,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardPgFee(),
//           notification: defaultNotification['default']!,
//         ),
//       ],
//     ),

//     // 4. Arts & Humanities
//     Faculty(
//       name: 'Arts & Humanities',
//       latitude: 28.53600000000000,
//       longitude: 81.62400000000000,
//       universityImage: '',
//       rating: 4.2,
//       number: 104,
//       course: [
//         Course(
//           name: 'BS English',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BS Mathematics',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BS Urdu',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'BS Islamiyat',
//           semesterCount: 8,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardUgFee(),
//           notification: defaultNotification['default']!,
//         ),
//       ],
//     ),

//     // 5. Law Department
//     Faculty(
//       name: 'Faculty of Law',
//       latitude: 28.53500000000000,
//       longitude: 81.62300000000000,
//       universityImage: '',
//       rating: 4.7,
//       number: 105,
//       course: [
//         Course(
//           name: 'BALLB (5 Years)',
//           semesterCount: 10,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getTenSemesterFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'LLB (3 Years)',
//           semesterCount: 6,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getSixSemesterFee(),
//           notification: defaultNotification['default']!,
//         ),
//         Course(
//           name: 'LLM (Master of Laws)',
//           semesterCount: 4,
//           contacts: courseSpecificContacts['default']!,
//           imageList: courseSpecificImages['default']!,
//           feeStructure: getStandardPgFee(),
//           notification: defaultNotification['default']!,
//         ),
//       ],
//     ),
//   ];

//   for (final faculty in faculties) {
//     final facultyDoc = firestore
//         .collection('UniversityAppData')
//         .doc(faculty.name);

//     await facultyDoc.set({
//       'name': faculty.name,
//       'latitude': faculty.latitude,
//       'longitude': faculty.longitude,
//       'rating': faculty.rating,
//       'number': faculty.number,
//       'universityImage': faculty.universityImage,
//     });

//     for (final course in faculty.course) {
//       final courseDoc = facultyDoc.collection('Course').doc(course.name);
//       await courseDoc.set(course.toMap());

//       for (int i = 0; i < course.semesterCount; i++) {
//         final semName = semesterLabels[i]['name'] as String;
//         final semOrder = semesterLabels[i]['order: 1'] as int;

//         final semesterData = SemesterData(
//           name: semName,
//           syllabus: {},
//           notes: {},
//           question: {},
//           exam: [],
//           order: semOrder,
//         );

//         await courseDoc
//             .collection('Semesters')
//             .doc(semName)
//             .set(semesterData.toMap());
//       }
//     }
//   }
// }

// class UploadScreen extends StatelessWidget {
//   const UploadScreen({super.key});

//   Future<void> _handleUpload(BuildContext context) async {
//     try {
//       await uploadFirestoreStructure();
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Upload Data Successfully!')),
//         );
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Error uploading data: $e')));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Upload Faculty Data')),
//       body: Center(
//         child: ElevatedButton.icon(
//           onPressed: () => _handleUpload(context),
//           label: const Text("Upload to firebase"),
//           icon: const Icon(Icons.upload_file),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SemesterData {
  final String name;
  final Map<String, dynamic> syllabus;
  final Map<String, dynamic> notes;
  final Map<String, dynamic> question;
  final List<Map<String, dynamic>> exam;
  final int order;

  SemesterData({
    required this.name,
    required this.syllabus,
    required this.notes,
    required this.question,
    required this.exam,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'syllabus': syllabus,
      'notes': notes,
      'question': question,
      'exam': exam,
      'order': order,
    };
  }
}

class Course {
  final String name;
  final int semesterCount;
  final List<Map<String, String>> contacts;
  final List<Map<String, dynamic>> notification;
  final List<String> imageList;
  final List<String> feeStructure;

  Course({
    required this.name,
    required this.semesterCount,
    required this.contacts,
    required this.imageList,
    required this.feeStructure,
    required this.notification,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'semesterCount': semesterCount,
      'contacts': contacts,
      'notification': notification,
      'imageList': imageList,
      'feeStructure': feeStructure,
    };
  }
}

class Faculty {
  final String name;
  final double latitude;
  final double longitude;
  final double rating;
  final int number;
  final String universityImage;
  final List<Course> course;
  final List<Map<String, dynamic>> events;
  final List<Map<String, String>> facultyMembers;

  Faculty({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.number,
    required this.universityImage,
    required this.course,
    required this.events,
    required this.facultyMembers,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'number': number,
      'universityImage': universityImage,
      'events': events,
      'facultyMembers': facultyMembers,
    };
  }
}

final List<Map<String, dynamic>> semesterLabels = [
  {'name': 'First Semester', 'order': 1},
  {'name': 'Second Semester', 'order': 2},
  {'name': 'Third Semester', 'order': 3},
  {'name': 'Fourth Semester', 'order': 4},
  {'name': 'Fifth Semester', 'order': 5},
  {'name': 'Sixth Semester', 'order': 6},
  {'name': 'Seventh Semester', 'order': 7},
  {'name': 'Eighth Semester', 'order': 8},
  {'name': 'Ninth Semester', 'order': 9},
  {'name': 'Tenth Semester', 'order': 10},
];

Map<String, List<Map<String, dynamic>>> defaultNotification = {
  'default': [
    {
      'title': 'Welcome to Academic Portal',
      'subtitle': 'Explore course materials, schedules, and faculty contacts.',
      'date': '2026-03-01',
      'image':
          'https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=600&q=80',
    },
    {
      'title': 'Mid-Term Examination Schedule',
      'subtitle':
          'Mid-term exams will commence from next week. Check exam tab.',
      'date': '2026-03-10',
      'image':
          'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?auto=format&fit=crop&w=600&q=80',
    },
  ],
};

Map<String, List<Map<String, String>>> courseSpecificContacts = {
  'default': [
    {
      'name': 'Nabin Paudyal',
      'address': 'Dailekh',
      'contact': '9876543210',
      'email': 'nabinpaudyal123@gmail.com',
    },
    {
      'name': 'Laxman BK',
      'address': 'Kathmandu',
      'contact': '9801234567',
      'email': 'laxmanbk@example.com',
    },
    {
      'name': 'Department Center',
      'address': 'Main Block, Room 102',
      'contact': '0836754806',
      'email': 'department@university.edu',
    },
  ],
};

Map<String, List<String>> courseSpecificImages = {
  'BS Civil': [
    'https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=800&q=80',
  ],
  'BS Computer Science': [
    'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=800&q=80',
  ],
  'default': [
    'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=800&q=80',
  ],
};

List<String> getStandardUgFee() => [
  'Semester 1 : NPR 68,450',
  'Semester 2 : NPR 58,450',
  'Semester 3 : NPR 58,450',
  'Semester 4 : NPR 58,450',
  'Semester 5 : NPR 58,450',
  'Semester 6 : NPR 58,450',
  'Semester 7 : NPR 58,450',
  'Semester 8 : NPR 58,450',
  'Total : NPR 477,600',
];

List<String> getStandardPgFee() => [
  'Semester 1 : NPR 70,000',
  'Semester 2 : NPR 60,000',
  'Semester 3 : NPR 60,000',
  'Semester 4 : NPR 60,000',
  'Total : NPR 250,000',
];

List<String> getTenSemesterFee() => [
  'Semester 1 : NPR 68,450',
  'Semester 2 : NPR 58,450',
  'Semester 3 : NPR 58,450',
  'Semester 4 : NPR 58,450',
  'Semester 5 : NPR 58,450',
  'Semester 6 : NPR 58,450',
  'Semester 7 : NPR 58,450',
  'Semester 8 : NPR 58,450',
  'Semester 9 : NPR 58,450',
  'Semester 10 : NPR 58,450',
  'Total : NPR 594,500',
];

Future<void> uploadFirestoreStructure() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final faculties = [
    // 1. Engineering & Technology
    Faculty(
      name: 'Engineering & Technology',
      latitude: 28.53871894035744,
      longitude: 81.62611371588851,
      universityImage:
          'http://googleusercontent.com/image_collection/image_retrieval/6999987442780100829_0',
      rating: 4.6,
      number: 101,
      events: [
        {
          'title': 'Engineering Expo 2026',
          'date': '2026-04-12',
          'venue': 'Engineering Block A',
          'image':
              'https://images.unsplash.com/photo-1581094794329-c8112a89af12?auto=format&fit=crop&w=600&q=80',
        },
      ],
      facultyMembers: [
        {
          'name': 'Dr. Alok Verma',
          'designation': 'Dean of Engineering',
          'email': 'alok.verma@university.edu',
        },
      ],
      course: [
        Course(
          name: 'BS Civil',
          semesterCount: 8,
          contacts: courseSpecificContacts['default']!,
          imageList:
              courseSpecificImages['BS Civil'] ??
              courseSpecificImages['default']!,
          feeStructure: getStandardUgFee(),
          notification: defaultNotification['default']!,
        ),
        Course(
          name: 'BS Hydropower',
          semesterCount: 8,
          contacts: courseSpecificContacts['default']!,
          imageList: courseSpecificImages['default']!,
          feeStructure: getStandardUgFee(),
          notification: defaultNotification['default']!,
        ),
      ],
    ),

    // 2. Computer Science & IT
    Faculty(
      name: 'Computer Science & IT',
      latitude: 28.53900000000000,
      longitude: 81.62700000000000,
      universityImage:
          'http://googleusercontent.com/image_collection/image_retrieval/986460480149997656_0',
      rating: 4.8,
      number: 102,
      events: [
        {
          'title': 'Annual Hackathon 2026',
          'date': '2026-05-10',
          'venue': 'IT Lab 3',
          'image':
              'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=600&q=80',
        },
      ],
      facultyMembers: [
        {
          'name': 'Prof. Anita Joshi',
          'designation': 'Head of Department',
          'email': 'anita.joshi@university.edu',
        },
      ],
      course: [
        Course(
          name: 'BS Computer Science',
          semesterCount: 8,
          contacts: courseSpecificContacts['default']!,
          imageList:
              courseSpecificImages['BS Computer Science'] ??
              courseSpecificImages['default']!,
          feeStructure: getStandardUgFee(),
          notification: defaultNotification['default']!,
        ),
        Course(
          name: 'BS Information Technology',
          semesterCount: 8,
          contacts: courseSpecificContacts['default']!,
          imageList: courseSpecificImages['default']!,
          feeStructure: getStandardUgFee(),
          notification: defaultNotification['default']!,
        ),
      ],
    ),

    // 3. Management Studies
    Faculty(
      name: 'Management Studies',
      latitude: 28.53700000000000,
      longitude: 81.62500000000000,
      universityImage:
          'http://googleusercontent.com/image_collection/image_retrieval/1064192704793484483_0',
      rating: 4.4,
      number: 103,
      events: [
        {
          'title': 'Business Leadership Summit',
          'date': '2026-04-25',
          'venue': 'Management Hall B',
          'image':
              'https://images.unsplash.com/photo-1515187029135-18ee286d815b?auto=format&fit=crop&w=600&q=80',
        },
      ],
      facultyMembers: [
        {
          'name': 'Dr. K. P. Bhattarai',
          'designation': 'HOD Management',
          'email': 'kp.bhattarai@university.edu',
        },
      ],
      course: [
        Course(
          name: 'BBA',
          semesterCount: 8,
          contacts: courseSpecificContacts['default']!,
          imageList: courseSpecificImages['default']!,
          feeStructure: getStandardUgFee(),
          notification: defaultNotification['default']!,
        ),
        Course(
          name: 'MBA Spring',
          semesterCount: 4,
          contacts: courseSpecificContacts['default']!,
          imageList: courseSpecificImages['default']!,
          feeStructure: getStandardPgFee(),
          notification: defaultNotification['default']!,
        ),
      ],
    ),

    // 4. Arts & Humanities
    Faculty(
      name: 'Arts & Humanities',
      latitude: 28.53600000000000,
      longitude: 81.62400000000000,
      universityImage:
          'http://googleusercontent.com/image_collection/image_retrieval/16063118522030401365_0',
      rating: 4.2,
      number: 104,
      events: [
        {
          'title': 'Cultural & Literary Fest',
          'date': '2026-05-18',
          'venue': 'Open Stage Auditorium',
          'image':
              'https://images.unsplash.com/photo-1460518451285-97b6aa326961?auto=format&fit=crop&w=600&q=80',
        },
      ],
      facultyMembers: [
        {
          'name': 'Prof. Sunita Rana',
          'designation': 'Dean of Arts',
          'email': 'sunita.rana@university.edu',
        },
      ],
      course: [
        Course(
          name: 'BS English',
          semesterCount: 8,
          contacts: courseSpecificContacts['default']!,
          imageList: courseSpecificImages['default']!,
          feeStructure: getStandardUgFee(),
          notification: defaultNotification['default']!,
        ),
      ],
    ),

    // 5. Faculty of Law
    Faculty(
      name: 'Faculty of Law',
      latitude: 28.53500000000000,
      longitude: 81.62300000000000,
      universityImage:
          'http://googleusercontent.com/image_collection/image_retrieval/8168277306817919404_0',
      rating: 4.7,
      number: 105,
      events: [
        {
          'title': 'National Moot Court Competition',
          'date': '2026-04-15',
          'venue': 'Auditorium Hall',
          'image':
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?auto=format&fit=crop&w=600&q=80',
        },
      ],
      facultyMembers: [
        {
          'name': 'Dr. Rajesh Sharma',
          'designation': 'Dean of Law',
          'email': 'rajesh.sharma@university.edu',
        },
      ],
      course: [
        Course(
          name: 'BA LLB',
          semesterCount: 10,
          contacts: courseSpecificContacts['default']!,
          imageList: courseSpecificImages['default']!,
          feeStructure: getTenSemesterFee(),
          notification: defaultNotification['default']!,
        ),
      ],
    ),
  ];

  for (final faculty in faculties) {
    final facultyDoc = firestore
        .collection('UniversityAppData')
        .doc(faculty.name);

    await facultyDoc.set(faculty.toMap());

    for (final course in faculty.course) {
      final courseDoc = facultyDoc.collection('Course').doc(course.name);
      await courseDoc.set(course.toMap());

      for (int i = 0; i < course.semesterCount; i++) {
        final semName = semesterLabels[i]['name'] as String;
        final semOrder = semesterLabels[i]['order'] as int;

        final semesterData = SemesterData(
          name: semName,
          syllabus: {
            'name': 'Syllabus',
            'url':
                'https://drive.google.com/drive/folders/1uh1peHCZFb08zNIJY-6QScnX365_qgPt?usp=sharing',
          },
          notes: {
            'name': 'Notes',
            'url':
                'https://drive.google.com/drive/folders/1aH36m2SbD6Jo0H7kyo5ooAANM0etV_Ru?usp=sharing',
          },
          question: {
            'name': 'Question',
            'url':
                'https://drive.google.com/drive/folders/1uh1peHCZFb08zNIJY-6QScnX365_qgPt?usp=sharing',
          },
          exam: [
            {
              'title': 'Mid-Term Routine',
              'date': '2026-04-10',
              'fileUrl':
                  'https://drive.google.com/drive/folders/sample-routine',
            },
            {
              'title': 'Final-Term Routine',
              'date': '2026-06-20',
              'fileUrl':
                  'https://drive.google.com/drive/folders/sample-routine',
            },
          ],
          order: semOrder,
        );

        await courseDoc
            .collection('Semesters')
            .doc(semName)
            .set(semesterData.toMap());
      }
    }
  }
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  Future<void> _handleUpload(BuildContext context) async {
    try {
      await uploadFirestoreStructure();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload Data Successfully!')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error uploading data: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Faculty Data')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _handleUpload(context),
          label: const Text("Upload to Firebase"),
          icon: const Icon(Icons.upload_file),
        ),
      ),
    );
  }
}
