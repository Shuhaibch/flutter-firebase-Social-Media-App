import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_x/presentations/Userpage/presentation/screens/login.dart';
import 'package:social_media_x/screens/authentication/sign_in_screen.dart';
import 'package:social_media_x/screens/authentication/sign_up_screen.dart';

import '../../blocs/auth/authenticaton_bloc/authentication_bloc.dart';
import '../../blocs/auth/sign_in/sign_in_bloc.dart';

ValueNotifier<bool> isSignUp = ValueNotifier(true);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Login());

    //   Container(
    // child: SingleChildScrollView(
    //   child: ValueListenableBuilder(
    //     valueListenable: isSignUp,
    //     builder: (context, value, child) {
    //       return isSignUp.value == true
    //           ? BlocProvider(
    //               create: (context) => SignInBloc(
    //                   userRepository:
    //                       context.read<AuthenticationBloc>().userRepository),
    //               child: const SignUpScreen(),
    //             )
    //           : BlocProvider(
    //               create: (context) => SignInBloc(
    //                   userRepository:
    //                       context.read<AuthenticationBloc>().userRepository),
    //               child: const SignInScreen(),
    //             );
    //     },
    //   ),
    // ),
    // );
  }
}
