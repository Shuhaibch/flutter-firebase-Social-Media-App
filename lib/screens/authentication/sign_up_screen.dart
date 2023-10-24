import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_x/blocs/sign_up/sign_up_bloc.dart';
import 'package:social_media_x/componets/height.dart';
import 'package:social_media_x/componets/string.dart';
import 'package:user_repository/user_repository.dart';

import '../../componets/textfeild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final passWordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  IconData passWordIcon = Icons.remove_red_eye_outlined;

  String? errorMsg;

  bool isVisible = true;
  bool signInRequired = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignUpFailure) {
          signInRequired = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Error Occured"),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //? name button
            kheight30,
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: AuthTextField(
                controller: nameCtrl,
                hindText: 'Name',
                obscureText: false,
                keyboardType: TextInputType.name,
                errorMsg: errorMsg,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Feild';
                  } else if (val.length > 30) {
                    return 'Name too long';
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //? email Button
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
                  } else if (emailRexExp.hasMatch(val)) {
                    return 'Please Enter a Valid Email';
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.email),
              ),
            ),

            //? password button
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: AuthTextField(
                controller: passWordCtrl,
                hindText: 'PassWord',
                obscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
                errorMsg: errorMsg,
                onChanged: (val) {
                  if (val!.contains(RegExp(r'[A-Z]'))) {
                    setState(() {
                      containsUpperCase = true;
                    });
                  } else {
                    setState(() {
                      containsUpperCase = false;
                    });
                  }
                  if (val.contains(RegExp(r'[a-z]'))) {
                    setState(() {
                      containsLowerCase = true;
                    });
                  } else {
                    setState(() {
                      containsLowerCase = false;
                    });
                  }
                  if (val.contains(RegExp(r'[0-9]'))) {
                    setState(() {
                      containsNumber = true;
                    });
                  } else {
                    setState(() {
                      containsNumber = false;
                    });
                  }
                  if (val.contains(specialCharRexExp)) {
                    setState(() {
                      containsSpecialChar = true;
                    });
                  } else {
                    setState(() {
                      containsSpecialChar = false;
                    });
                  }
                  if (val.length >= 8) {
                    setState(() {
                      contains8Length = true;
                    });
                  } else {
                    setState(() {
                      contains8Length = false;
                    });
                  }
                  return null;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Field';
                  } else if (passRexExp.hasMatch(val)) {
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
            //?  PassWord Checker row
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⚈  1 uppercase",
                      style: TextStyle(
                          color: containsUpperCase
                              ? Colors.green
                              : Theme.of(context).colorScheme.error),
                    ),
                    Text(
                      "⚈  1 lowercase",
                      style: TextStyle(
                          color: containsLowerCase
                              ? Colors.green
                              : Theme.of(context).colorScheme.error),
                    ),
                    Text(
                      "⚈  1 number",
                      style: TextStyle(
                          color: containsNumber
                              ? Colors.green
                              : Theme.of(context).colorScheme.error),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⚈  1 special character",
                      style: TextStyle(
                          color: containsSpecialChar
                              ? Colors.green
                              : Theme.of(context).colorScheme.error),
                    ),
                    Text(
                      "⚈  8 minimum character",
                      style: TextStyle(
                          color: contains8Length
                              ? Colors.green
                              : Theme.of(context).colorScheme.error),
                    ),
                  ],
                ),
              ],
            ),
            //? Confirm Password button
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: AuthTextField(
                controller: confirmPassCtrl,
                hindText: 'Confirm PassWord',
                obscureText: isVisible,
                keyboardType: TextInputType.visiblePassword,
                errorMsg: errorMsg,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Field';
                  } else if (passRexExp.hasMatch(val)) {
                    return 'Please Enter a Valid passWord';
                  } else if (identical(val, passWordCtrl)) {
                    return 'Password and Confirm password are not same';
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
                          MyUser myUser = MyUser.empty;
                          myUser = myUser.copyWith(
                            email: emailCtrl.text,
                            name: nameCtrl.text,
                          );

                          context.read<SignUpBloc>().add(
                                SignUpRequired(
                                    myUser: myUser,
                                    passWord: passWordCtrl.text),
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
