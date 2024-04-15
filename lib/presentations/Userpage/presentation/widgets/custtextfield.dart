
import 'package:flutter/material.dart';

class Custtextfield extends StatelessWidget {
  const Custtextfield({
    super.key, required this.title, required this.icon,
  });
    final String title;
    final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: title,
          fillColor: Colors.white,
          filled: true,
          prefixIcon:  Icon(icon, size: 30),
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(55),
            borderSide: const BorderSide(width: 1008),
          ),
        ),
      ),
    );
  }
}
