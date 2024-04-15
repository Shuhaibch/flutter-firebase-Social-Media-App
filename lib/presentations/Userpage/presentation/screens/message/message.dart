
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_x/presentations/Userpage/presentation/screens/message/single_screen.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 10, 10),
            child: Container(
              child: Text(
                "MESSAGE",
                style: GoogleFonts.imprima(fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SingleScreen(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              "https://th.bing.com/th?id=OIP.-HoDebcd1MseGnmiTJALDAHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, color: Colors.black),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("username"),
                              Text("vcgfdjthhjhhghghg")
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Text("4/12/2023"),
                      ],
                    ),
                  ),      
                );
              },
              itemCount: 15,
            ),
          )
        ],
      ),
    );
  }
}
