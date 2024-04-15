import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custtextfield.dart';
import 'main_page.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return  Scaffold(
       backgroundColor: Colors.transparent,
       body:SingleChildScrollView(
         child: Container(
          width: double.infinity,
          height: size.height,

           decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('asset/images/temp.png'),fit: BoxFit.fill),
             ),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Column(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 130,bottom: 90),  
                    child: Text("New User? \nSignup",
                      style: GoogleFonts.imprima(color: Colors.black, fontSize: 35),
                    ),
                  ),
                ],
              ),
              
                        Container(
                          alignment: Alignment.center,
                          child: const Column(
                            children: [
                              Custtextfield(
                                            icon: null,
                                            title: 'Username',
                                          ),
                                          
                               Custtextfield(
                                          icon: null,
                                          title: 'Phone no',
                                        ),
                                             Custtextfield(
                                          icon: null,
                                          title: 'Email',
                                        ),
                                             Custtextfield(
                                          icon: null,
                                          title: 'Password',
                                        ),
                                             Custtextfield(
                                          icon: null,
                                          title: 'Confirm Password',
                                        ),
                            ],
                          ),
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
                    ), child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black)
                    ),
                        ),
            ],
           ),
         ),
       )
                
    );  }
}