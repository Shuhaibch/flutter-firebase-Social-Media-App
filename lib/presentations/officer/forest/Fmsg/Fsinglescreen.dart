import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fsinglescreen extends StatelessWidget {
  const Fsinglescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: .05,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CachedNetworkImage(
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
              ),
              Text(
                "Username",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                height: height * .75,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Message...',
                  suffixIcon: const Icon(Icons.send),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1008),
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
