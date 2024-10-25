import 'package:flutter/material.dart';
import 'package:radhe_radhe/home.dart';

// PostWidget to Render Each Post
class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile and Name
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.post.profileImage),
              ),
              const SizedBox(width: 10),
              Text(
                widget.post.name,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Post Image
          Image.asset(
            widget.post.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 10),

          // Description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.post.description,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),

          // Action Buttons
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: widget.post.isLiked ? Colors.red : Colors.white,
                ),
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    widget.post.isLiked = !widget.post.isLiked;
                  });
                },
              ),
              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.comment, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  print("Comment button pressed");
                },
              ),
              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  print("Share button pressed");
                },
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.save, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  print("Save button pressed");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
