import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_x/presentations/officer/veterinary/Vprofile.dart';
class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 300,left: 10,top: 15,bottom: 15),
            child: Text(
              'About ',
              style: GoogleFonts.imprima(fontSize: 25),
              ),
          ),
        const  Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: TIle(
              title: 'Privacy Policy',
              subtitle: 'null',
              icons: Icons.access_alarm,
            ),
          ),
         const Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: TIle(
              title: 'Terms of Use',
              subtitle: 'null',
              icons: Icons.accessibility_new_rounded,
            ),
          )
        ],
      )),
    );
  }
}
