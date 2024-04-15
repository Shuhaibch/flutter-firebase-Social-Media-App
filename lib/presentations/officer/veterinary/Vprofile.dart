
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VProfile extends StatelessWidget {
  const VProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA4f6wnsNip4N-P-57m1bUYxRx7zsz7Q1uFA&usqp=CAU',
                        ),
                      ),
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
                          print(image!.path.toString());
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
                children: [Text('Reports',style: TextStyle(fontSize: 20)), Text("00",style: TextStyle(fontSize: 20))],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
                child: Column(
                  children: [
                    TIle(
                      title: 'Personal Information',
                      subtitle: 'email,password,mobile number',
                      icons: Icons.person,
                    ),
                    TIle(
                        title: 'language',
                        subtitle: 'Change your language',
                        icons: Icons.language_outlined),
                    TIle(
                        title: 'Security',
                        subtitle: 'Change password',
                        icons: Icons.security),
                    TIle(
                        title: 'Accounts',
                        subtitle: 'Change your accounts',
                        icons: Icons.person),
                    TIle(
                        title: 'Appearance',
                        subtitle: 'Set theme',
                        icons: Icons.remove_red_eye_outlined),
                    TIle(
                        title: 'Info',
                        subtitle: 'Privacy policy,About us',
                        icons: Icons.info),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TIle extends StatelessWidget {
  const TIle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
  });
  final String title;
  final String subtitle;
  final IconData icons;
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
                  Text(subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
