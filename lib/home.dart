import 'package:flutter/material.dart';
import 'package:radhe_radhe/Post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //   // List to store image paths
  final List<String> imagePaths = [
    "assest/img/Ganesha.jpeg",
    "assest/img/krishna.jpg",
    "assest/img/shegaon.jpeg",
    "assest/img/ShriRadha.jpg",
    "assest/img/Ganesha.jpeg",
    "assest/img/Ganesha.jpeg",
    "assest/img/krishna.jpg",
    "assest/img/Ganesha.jpeg"
  ];
  // List of posts
  final List<Post> posts = [
    Post(
        profileImage: "assest/img/Ganesha.jpeg",
        name: "Giridharlaal",
        imageUrl: "assest/img/krishna.jpg",
        description: "Ab sop diya is jeevan ka,\n"
            "sab bhar tumhare hatho me,\n"
            "Jeet tumhare hatho me,\n"
            "hai har tumhare hatho me"),
    Post(
      profileImage: "assest/img/krishna.jpg",
      name: "Shri Radha_Gopinath",
      imageUrl: "assest/img/ShriRadha.jpg",
      description: "Bhaj-Man Radhe Radhe",
    ),

    Post(
        profileImage: "assest/img/shegaon.jpeg",
        name: "Gajanan_Maharaj",
        imageUrl: "assest/img/shegaon.jpeg",
        description: "Mauli")
    // Add more posts here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "assest/img/rr.png",
            width: 150,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Welcome Section
            // Container(height: 3, color: Colors.orange),
            SizedBox(
              height: 10,
            ),

            // Scrollable row using map method for dynamic generation of circles
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      imagePaths.map((imgPath) => circle(imgPath)).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            const SizedBox(height: 10),

            // Posts Section - Dynamic Generation of Posts
            ...posts.map((post) => PostWidget(post: post)).toList(),
          ],
        ),
      ),
    );
  }

  Container circle(String img) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: const Radius.circular(50),
          right: const Radius.elliptical(50, 50),
        ),
        // Apply the gradient similar to Instagram's profile ring
        gradient: const LinearGradient(
          colors: [
            Color(0xFFfeda75), // Yellow
            Color(0xFFfa7e1e), // Orange
            Color(0xFFd62976), // Pink
            Color(0xFF962fbf), // Purple
            Color(0xFF4f5bd5), // Blue
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
    );
  }
}

// Post Class
class Post {
  final String profileImage;
  final String name;
  final String imageUrl;
  final String description;
  bool isLiked;

  Post({
    required this.profileImage,
    required this.name,
    required this.imageUrl,
    required this.description,
    this.isLiked = false,
  });
}
