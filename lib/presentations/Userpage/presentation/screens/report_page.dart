import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  Report({
    Key? key,
  }) : super(key: key);
  // final String? title;
  final List<String> dropDown = [
    "Police",
    "Veterinary",
    'Forest',
  ];

  @override
  Widget build(BuildContext context) {
    
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  ValueNotifier<String> dropdownNotifier = ValueNotifier('Select the category');
    //  final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Report',
                style: TextStyle(fontSize: 30 ),
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                     height: 50,
                     width: 60,
      
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(171, 110, 169, 172),
                      borderRadius: const BorderRadius.all(Radius.elliptical(10, 10  )),
                      border:Border.all(
                        width: 1,
                        color: Colors.black,
                         )
                    ),
                    child: Image.asset('asset/images/camera1.png')
                    
                    
                    ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                       height: 50,
                       width: 60,
                  
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(171, 110, 169, 172),
                        borderRadius: const BorderRadius.all(Radius.elliptical(10, 10  )),
                        border:Border.all(
                          width: 1,
                          color: Colors.black,
                           )
                      ),
                       child: Image.asset('asset/images/phone.png')
                      ),
                  ),
                  Container(
                     height: 50,
                     width: 60,
      
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(171, 110, 169, 172),
                      image: const DecorationImage(image: AssetImage('asset/images/location.png')),
                      borderRadius: const BorderRadius.all(Radius.elliptical(10, 10  )),
                      border:Border.all(
                        width: double.infinity,
                        color: Colors.black,
                         )
                    ),
                    //  child: Image.asset('asset/images/location.png')
                    ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: dropdownNotifier,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton( 
                        hint: Text(dropdownNotifier.value),
                        items: dropDown.map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        onChanged: (value) {
                          dropdownNotifier.value = value!;
                        },
                      ),
                    ],
                  );
                },
              ),
              TextField(
                controller: addresscontroller,
                maxLines: 5,
                maxLength: 100,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Type Address here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              TextField(
                controller: descriptioncontroller,
                maxLines: 3,
                maxLength: 100,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              TextButton(
                  onPressed: () {
                    print(addresscontroller.text);
                    if (addresscontroller.text.isEmpty || descriptioncontroller.text.isEmpty )  {
                      ScaffoldMessenger.of(context).showSnackBar(
                        
                        const SnackBar(content: Text("Addres or Description is empty"),backgroundColor: Colors.redAccent),
                      );
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade400),
                    ),
                  
                  child: const Text('submit',style: TextStyle(color: Colors.black),)
                  )
            ],
          ),
        ),
      ),
    );
  }
}
