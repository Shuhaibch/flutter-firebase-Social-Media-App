import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_x/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:social_media_x/componets/sized_box.dart';
import 'package:social_media_x/componets/string.dart';
import 'package:social_media_x/componets/textfeild.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();

  final passWordCtrl = TextEditingController();

  IconData passWordIcon = Icons.remove_red_eye_outlined;

  String? errorMsg;

  bool isVisible = true;

  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Invalid UserName or passWord"),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            kheight30,
            //? Email Bottun
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: AuthTextField(
                controller: emailCtrl,
                hindText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                errorMsg: errorMsg,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Feild';
                  } else if (!emailRexExp.hasMatch(val)) {
                    return 'Please Enter a Valid Email';
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //? password
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: AuthTextField(
                controller: passWordCtrl,
                hindText: 'PassWord',
                obscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
                errorMsg: errorMsg,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Field';
                  } else if (!passRexExp.hasMatch(val)) {
                    return 'Please Enter a Valid passWord';
                  }
                  return null;
                },
                sufixIcon: IconButton(
                  icon: Icon(passWordIcon),
                  onPressed: () {
                    setState(
                      () {
                        isVisible = !isVisible;
                        if (isVisible) {
                          passWordIcon = Icons.visibility;
                        } else {
                          passWordIcon = Icons.visibility_off_outlined;
                        }
                      },
                    );
                  },
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            !signInRequired
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignInBloc>().add(
                                SignInRequired(
                                    emailCtrl.text, passWordCtrl.text),
                              );
                        }
                      },
                      style: TextButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 5,
                        ),
                        child: Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
