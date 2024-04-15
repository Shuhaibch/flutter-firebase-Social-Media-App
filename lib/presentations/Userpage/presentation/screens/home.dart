import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_x/blocs/auth/sign_in/sign_in_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Critter",
                  style: GoogleFonts.imprima(fontSize: 35),
                ),
                InkWell(
                  onTap: () {
                    context.read<SignInBloc>().add(SignOutRequired());
                  },
                  child: const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              // height: height*0.75,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 1000,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.AHwK1deUsAV0RyrLxGBlLwHaHa?pid=ImgDet&w=182&h=182&c=7&dpr=1.3",
                            ),
                          ),
                        ),
                        width: double.infinity,
                        height: 500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "how are you",
                            style: GoogleFonts.arima(fontSize: 18),
                          ),
                          const Icon(Icons.message),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
