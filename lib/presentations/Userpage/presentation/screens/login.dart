import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custtextfield.dart';
import 'main_page.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('asset/images/temp.png'),fit: BoxFit.fill),
      ),
      child:  Scaffold(
           backgroundColor: Colors.transparent,
           body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [  
                Padding(
                  padding: const EdgeInsets.only(left: 150,bottom: 150,top: 40),
                  child: Text(
                    "Welcome to \n Critter",
                    style: GoogleFonts.imprima(color: Colors.black, fontSize: 35),
                  ),
                ),
                Image.asset('asset/images/c.png',
                  height: 80,
                  width: 80,
                ),
                
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'LOGIN NOW',
                    style: GoogleFonts.abhayaLibre(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Custtextfield(
                    icon: Icons.mail,
                    title: 'Email',
                  ),
    
                  const Custtextfield(title: 'password', icon: Icons.key),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text('Forgot Password'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>MainPage(),
                      )); 
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade400),
                    ),
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Text("OR"),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/images/google.png',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        'asset/images/facebook.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'New to Here? Signup',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}   
            