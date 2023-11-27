import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "user Name",
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.subject,
          ),
        ),
      ],
    );
  }
}
