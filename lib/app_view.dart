import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_x/blocs/authenticaton_bloc/authentication_bloc.dart';
import 'package:social_media_x/screens/home/home_screen.dart';
import 'package:social_media_x/screens/authentication/welcome_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Color.fromARGB(255, 71, 11, 82),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 75, 10, 86),
          onSecondary: Colors.white,
          tertiary: Colors.lime,
          error: Colors.red,
          outline: Color.fromARGB(255, 124, 121, 121),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const HomeScreen();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
