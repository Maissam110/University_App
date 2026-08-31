import 'package:cloud_firestore/cloud_firestore.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  factory OnboardingModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return OnboardingModel(
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
    );
  }
}
