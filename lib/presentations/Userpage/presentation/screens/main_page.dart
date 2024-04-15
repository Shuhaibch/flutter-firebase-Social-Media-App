import 'package:flutter/material.dart';

import '../widgets/bottomnavigation.dart';
import 'home.dart';
import 'message/message.dart';
import 'profile page/profile.dart';
import 'report_page.dart';
import 'upload.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List _pages = [
   const Home(),
   const Message(),
   const Upload(),
    Report(),
  const  Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet:   ,
        bottomNavigationBar: const BottomNav(),
        body: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, _) {
            
            return value == 2?
            _pages[value]:_pages[value];
          },
        ));
  }
}
