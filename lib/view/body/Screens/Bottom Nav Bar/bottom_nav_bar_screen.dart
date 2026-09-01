import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:university/Model/new_model.dart';
import 'package:university/view/body/Screens/Bottom%20Nav%20Bar/google_map_screen.dart';
import 'package:university/view/body/Screens/Bottom%20Nav%20Bar/profile_screen.dart';
import 'package:university/view/body/Screens/Home/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  final Semester semester;
  final Course course;
  final Faculty faculty;
  const BottomNavBarScreen({
    super.key,
    required this.semester,
    required this.course,
    required this.faculty,
  });

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  late final List<Widget> _screen;
  @override
  void initState() {
    _screen = [
      HomeScreen(semester: widget.semester, course: widget.course),
      GoogleMapScreen(faculty: widget.faculty),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        elevation: 0.05,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_1),
            label: 'home',
            activeIcon: Icon(Iconsax.home_2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
            activeIcon: Icon(Iconsax.map),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
