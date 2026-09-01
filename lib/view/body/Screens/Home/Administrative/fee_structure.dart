import 'package:flutter/material.dart';
import 'package:university/Model/new_model.dart';

class FeeStructure extends StatelessWidget {
  final Course course;
  const FeeStructure({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Fee Structure of ${course.name}"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),

      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: course.feeStructure.length,
          itemBuilder: (context, index) {
            final feeText = course.feeStructure[index];
            return Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                feeText,
                style: TextStyle(fontSize: 16, color: color),
              ),
            );
          },
        ),
      ),
    );
  }
}
