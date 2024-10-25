import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // List of image URLs
  final List<String> imageUrls = [
    'https://i.pinimg.com/736x/f5/99/11/f59911f773cd6b8df4c6f3f0eb5eee1a.jpg',
    'https://ghantee.com/wp-content/uploads/2024/08/image-of-radha-rani-1.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsS_2uwKMMh0VC9NITjmHxClVxVHVj1n1AyQ&s',
    'https://ghantee.com/wp-content/uploads/2024/02/mesmerising-radha-rani-wallpaper.jpg',
    'https://i.pinimg.com/200x/69/ae/23/69ae23910e7a8609bf2b57eba0c18301.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGoPn0CwddHjTg5Mp94ZtVfSsjAEui0VUrzlpm-QE_ca2yECe51MjxmNAMpCWymJrj4pI&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8t2XmJdEY-Ll-mNBCv0eDgqtrT_TlDLmqng15e3dtGxce_NdmwcoQyJpW3BCaKlXXD4&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zYByUEtc-9EqSVexd0u8dFB1bGJGFI5IGWs7yMm9jKYe7NKObgQ-qGu81oFOCSDrNCs&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1m1IrtKXROG0JeVuy4MCv5NS7Z4NqRGco_w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLuROdmr6jfxff5CYzQmyu9F1-VzZzMNs53w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8DT5pfK3gMfJwWzjAH7BQeN1oigHtDI708GBLb0Mivukh1gy-shom_zT2XAcjv_xLfXc&usqp=CAU',
    'https://images.unsplash.com/photo-1725988415840-b69ae3328e96?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNhbmF0YW4lMjBkaGFybWF8ZW58MHx8MHx8fDA%3D',
    'https://i.pinimg.com/236x/c8/e7/f7/c8e7f736527e8cf98996745cf4b85d53.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOzuhCeFPlXXdTOYu13sytVzgrUafEez3mJw&s',
    'https://pbs.twimg.com/media/E6Yyf8aVgAAzC7o.jpg',
    'https://i.pinimg.com/236x/c7/f0/ff/c7f0ff722b243c971da68d64ddf8b5d3.jpg',
    'https://agoodmorning.in/wp-content/uploads/2024/05/3d-ganesh-ji-wallpaper-3d-ganesh-ji-photos-beautiful-background-amazing-3d-ganesh-44-960x960.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnhWqWexkl2zhPiVWHuHa24RLuE3HxYzO-cw&s',
    'https://t4.ftcdn.net/jpg/03/39/23/55/360_F_339235538_EXU9brPgkxfjJSIdLhfxk1llJNdVJIJO.jpg',
    'https://i.pinimg.com/564x/57/06/52/57065297387a31ad7bb26a80a38af834.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIIeOKtsmYkrLKP-PqD7J0kg5nJ31WKkVi-g&s',
    'https://pbs.twimg.com/media/FGpjrB7WQAYbFQ_.jpg:large',
    'https://i.pinimg.com/236x/d1/70/e3/d170e31502183e33101caab122902981.jpg',
    'https://i.pinimg.com/736x/dd/aa/10/ddaa100c9809966047d1348f0e72511e.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdyvl-dcgdCMGsEWPaQHJOb2pR0QG1YloRFcXI-p_ooDwfx1POFAu6x5DPR4r6LvTsEnU&usqp=CAU',
    'https://i.pinimg.com/474x/2a/d5/bc/2ad5bc38a6e46a89712fb8c00130b4b7.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT9hwmuW14iDNp3j_4jbmJ0-xSRb3v1sbfej64LEPe-kpGorkvC_wtB5NPnk5wmg2iT9s&usqp=CAU',
    'https://images.unsplash.com/photo-1725776311683-f10492fa8855?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c2FuYXRhbiUyMGRoYXJtYXxlbnwwfHwwfHx8MA%3D%3D',
    'https://pbs.twimg.com/media/F1msxcxaMAAj4hB.jpg',
    'https://pbs.twimg.com/media/GATmWL9bcAAVpCv.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg37v0YzDmRD9FmoW9aL7AIQjxw2gw9t8okQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCAgZbftSMVReO3tq2mdTDBIrDo-J74c94lw&s',
    'https://i.pinimg.com/736x/3b/0e/f2/3b0ef2d5b593ad2054dc2d2cb19abb1f.jpg',
    'https://e0.pxfuel.com/wallpapers/569/991/desktop-wallpaper-jai-hanuman-hinduism-ravan-hindu-sita-shrilanka-indiangod-mahadev-shriram-ram-thumbnail.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToBCpSCHeUTtzCc13rZ_t9zZU09LqNCV0vZA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxZue_gSa8kQFGcSNwn8W35dYE51ULjYoDFXa-38IC1vnNnHGGvf20iY9brGhTRhJpT9w&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imageUrls.length, // Total number of images
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
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
      backgroundColor: Colors.black,
    );
  }
}
