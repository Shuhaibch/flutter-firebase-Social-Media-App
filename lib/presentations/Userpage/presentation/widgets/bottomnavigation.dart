

import 'dart:developer';

import 'package:flutter/material.dart';
ValueNotifier<int>valueNotifier=ValueNotifier(0);
class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, index, _) {
        
        return BottomNavigationBar(
        
         type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: index,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (touchvalue) {


log(touchvalue.toString(), name: 'yji');
           valueNotifier.value=touchvalue;



           print(touchvalue.toString());
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled,), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.message,), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_rounded,),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.report,), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin,), label: ''),
          ],
        );
      },
    );
  }
}
