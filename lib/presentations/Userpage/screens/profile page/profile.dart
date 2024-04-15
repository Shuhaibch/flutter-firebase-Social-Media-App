import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../presentation/screens/profile page/info.dart';
import '../../presentation/screens/profile page/pass.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/images/camera1.png')),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 400,
                          maxWidth: 400,
                          // imageQuality: Null,
                        );
                        log(image!.path.toString());
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Post",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "00",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                Text('Reports', style: TextStyle(fontSize: 20)),
                Text("00", style: TextStyle(fontSize: 20))
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const info(),
                          ));
                    },
                    child: const TIle(
                      title: 'Personal Information',
                      subtitle: 'email,password,mobile number',
                      icons: Icons.person,
                      image: null,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const pass(),
                          ));
                    },
                    child: const TIle(
                        title: 'Security',
                        subtitle: 'Change password',
                        icons: Icons.security, image: null,),
                  ),
                  const TIle(
                      title: 'Accounts',
                      subtitle: 'Change your accounts',
                      icons: Icons.person, image: null,),
                  
                  const TIle(
                      title: 'About',
                      subtitle: 'Privacy policy,Terms of Use',
                      icons: Icons.info, image: null,),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class TIle extends StatelessWidget {
  const TIle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
    required this.image,
  });
  final String title;
  final String? subtitle;
  final IconData? icons;
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icons,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(subtitle!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
