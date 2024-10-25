import 'dart:math';

import 'package:flutter/material.dart';
import 'package:radhe_radhe/Edit.dart';
import 'package:radhe_radhe/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

//List for image urls
final List<String> imageUrls = [
  'https://i.pinimg.com/736x/f5/99/11/f59911f773cd6b8df4c6f3f0eb5eee1a.jpg',
  'https://ghantee.com/wp-content/uploads/2024/08/image-of-radha-rani-1.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsS_2uwKMMh0VC9NITjmHxClVxVHVj1n1AyQ&s',
  'https://ghantee.com/wp-content/uploads/2024/02/mesmerising-radha-rani-wallpaper.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnhWqWexkl2zhPiVWHuHa24RLuE3HxYzO-cw&s',
  'https://t4.ftcdn.net/jpg/03/39/23/55/360_F_339235538_EXU9brPgkxfjJSIdLhfxk1llJNdVJIJO.jpg',
  'https://i.pinimg.com/564x/57/06/52/57065297387a31ad7bb26a80a38af834.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIIeOKtsmYkrLKP-PqD7J0kg5nJ31WKkVi-g&s',
  'https://pbs.twimg.com/media/FGpjrB7WQAYbFQ_.jpg:large',
  'https://i.pinimg.com/236x/d1/70/e3/d170e31502183e33101caab122902981.jpg',
  'https://i.pinimg.com/736x/dd/aa/10/ddaa100c9809966047d1348f0e72511e.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdyvl-dcgdCMGsEWPaQHJOb2pR0QG1YloRFcXI-p_ooDwfx1POFAu6x5DPR4r6LvTsEnU&usqp=CAU',
];

class _Profile_PageState extends State<Profile_Page> {
  String? name = "Username";
  String? Bio = "Bio";
  String? mobile_no = " xx";
  String? email = " xx";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setBool('login', false);
    setState(() {
      name = prefs.getString('name') ?? "Username";
      Bio = prefs.getString('bio') ?? "Bio";
      mobile_no = prefs.getString('phone') ?? "xx";
      email = prefs.getString('email') ?? "xx";
    });

    print(name);
    // return ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Profile Page",
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ]),
        backgroundColor: Colors.black,

        //logout button work
        actions: [
          GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('login', false);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => UserInfoForm()));
            },
            // done logout button work

            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/550x/42/12/3b/42123b2ee4709e72b3e8264cb60bd73d.jpg"),
                ),
                Column(
                  children: [
                    Text(
                      "Post",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "12",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Followers",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "15M",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Following",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "0",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${Bio}",

                      // "यदा यदा हि धर्मस्य ग्लानिर्भवति भारत,\n"
                      // "अभ्युत्थानमधर्मस्य तदात्मानं सृजाम्यहम्,\n"
                      // "परित्राणाय साधूनाम् विनाशाय च दुष्कृताम्,\n"
                      // "धर्मसंस्थापनार्थाय सम्भवामि युगे युगे",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                )),
          ),

          //Edit option

          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      bool? isEdited = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                      if (isEdited == true) {
                        getdata();
                      }
                    },
                    child: Text("Edit Profile")),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

// Adding Separator

          Container(
            height: 5,
            color: Colors.white, // Set the color in a Container
          ),

          SizedBox(
            height: 15,
          ),

          //Post Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: imageUrls.length, // Total number of images
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 8.0, // Space between columns
                  mainAxisSpacing: 8.0, // Space between rows
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover, // Makes the image cover the area
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(
                            Icons.error); // Error icon if image fails to load
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
