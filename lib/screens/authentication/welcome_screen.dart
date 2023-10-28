// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_x/blocs/auth/authenticaton_bloc/authentication_bloc.dart';
import 'package:social_media_x/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:social_media_x/blocs/auth/sign_up/sign_up_bloc.dart';
import 'package:social_media_x/componets/sized_box.dart';
import 'package:social_media_x/screens/authentication/sign_in_screen.dart';
import 'package:social_media_x/screens/authentication/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  static String greeting = "Welcome Back !";
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: //? greeting Text
            Center(
          child: Text(
            greeting,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .80,
          child: Column(
            children: [
              kheight10,
              TabBar(
                controller: tabController,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                labelColor: Theme.of(context).colorScheme.onBackground,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "sign In",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "sign Up",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
                onTap: (value) {
                  if (value == 0) {
                    setState(() {
                      greeting = "Welcome Back !";
                    });
                  } else {
                    setState(() {
                      greeting = "Hey There !";
                    });
                  }
                },
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    BlocProvider(
                      create: (context) => SignInBloc(
                          userRepository: context
                              .read<AuthenticationBloc>()
                              .userRepository),
                      child: const SignInScreen(),
                    ),
                    BlocProvider(
                      create: (context) => SignUpBloc(
                          userRepository: context
                              .read<AuthenticationBloc>()
                              .userRepository),
                      child: const SignUpScreen(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
