import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custtextfield.dart';

class info extends StatelessWidget {
  const info({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
           children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10),
                  child: Text('Personal information',
                  style:GoogleFonts.imprima(fontSize: 25)
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
                                const Custtextfield(
                                              icon: null,
                                              title: 'Email',
                                            ),
                                            
                               const  Custtextfield(
                                            icon: null,
                                            title: 'Password',
                                          ),
                                const Custtextfield(
                                            icon: null,
                                            title: 'Confirm Password',
                                          ),
                                 const Custtextfield(
                                            icon: null,
                                            title: 'Mobile no',
                                          ),
                               const  Custtextfield(
                                            icon: null,
                                            title: 'Name',
                                          ),
                                          // TextButton(onPressed: onPressed, child: child)
                            TextButton(onPressed:  () {
                              Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>const info(),
                            
                      )); 
                            },
                      style:const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.black54),
                    ),
                             child:const  Text('Submit'))
                              ],
                              
                            ),        
      ),
    );
  }
}