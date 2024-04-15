import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:social_media_x/blocs/auth/my_user_bloc/my_user_bloc.dart';
import 'package:social_media_x/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:social_media_x/blocs/auth/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:social_media_x/blocs/post/post_bloc/post_bloc.dart';
import 'package:social_media_x/presentations/authentication/welcome_screen.dart';
import 'package:social_media_x/screens/home/home_screen.dart';
import 'blocs/auth/authenticaton_bloc/authentication_bloc.dart';
import 'presentations/Userpage/presentation/screens/main_page.dart';

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
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
                BlocProvider(
                  create: (context) => MyUserBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  )..add(
                      GetMyUser(
                        myUserId:
                            context.read<AuthenticationBloc>().state.user!.uid,
                      ),
                    ),
                ),
                BlocProvider(
                  create: (context) => UpdateUserInfoBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
                BlocProvider(
                  create: (context) => PostBloc(
                    postRepository: FirebasePostRepository(),
                  )..add(
                      GetPost(),
                    ),
                ),
              ],
              child: HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
