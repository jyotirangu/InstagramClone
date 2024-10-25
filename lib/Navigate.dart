import 'package:flutter/material.dart';
import 'package:radhe_radhe/Explore.dart';
import 'package:radhe_radhe/Profile.dart';
import 'package:radhe_radhe/home.dart'; // Assuming your Home widget is in home.dart

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int _currentIndex = 0;

  // List of widgets for each tab
  final List<Widget> _pages = [
    const Home(), // Home page widget (already implemented)
    const Explore(), // Placeholder for Explore page
    const Profile_Page(), // Placeholder for Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current tab index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange, // Active tab color
        unselectedItemColor: Colors.white, // Inactive tab color
      ),
    );
  }
}

// Placeholder for Explore Page
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          'Explore Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Placeholder for Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
