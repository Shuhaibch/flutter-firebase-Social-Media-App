import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custtextfield.dart';

class pass extends StatelessWidget {
  const pass({super.key});

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
                  padding:const EdgeInsets.only(left: 20,top: 10),
                  child: Text('Security',
                  style:
                      GoogleFonts.imprima(fontSize: 25),
                ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
                                const Custtextfield(
                                              icon: null,
                                              title: 'Enter current password',
                                            ),
                                            
                               const  Custtextfield(
                                            icon: null,
                                            title: 'New Password',
                                          ),
                                const Custtextfield(
                                            icon: null,
                                            title: 'Confirm New Password',
                                          ),
                               
                                          // TextButton(onPressed: onPressed, child: child)
                            TextButton(onPressed:  () {
                              Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>const pass(),
                            
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