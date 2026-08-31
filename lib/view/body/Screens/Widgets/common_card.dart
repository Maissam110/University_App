import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String imageofCard;
  const CommonCard({
    super.key,
    required this.title,
    this.onTap,
    required this.imageofCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Card(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0.5,
          shadowColor: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: 120,
                child: Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.network(imageofCard, fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
