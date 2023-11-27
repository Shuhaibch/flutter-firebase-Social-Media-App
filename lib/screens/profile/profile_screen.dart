import 'package:flutter/material.dart';
import 'package:social_media_x/componets/sized_box.dart';
import 'package:social_media_x/screens/profile/widgets/app_bar.dart';
import 'package:social_media_x/screens/profile/widgets/grid_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          height * .085,
        ),
        child: const ProfileAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
                kWidth10,
                SizedBox(
                  width: width * .65,
                  height: height * .18,
                  // color: Colors.amberAccent,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name of User",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      kheight10,
                      const Text(
                        "Total Number of Post",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      kheight10,
                      Row(
                        children: [
                          kWidth30,
                          Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: width * .5,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                      Radius.elliptical(
                                        25,
                                        25,
                                      ),
                                    ),
                                  ),
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              kheight10,
                              GestureDetector(
                                child: Container(
                                  width: width * .5,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                      Radius.elliptical(
                                        25,
                                        25,
                                      ),
                                    ),
                                  ),
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      "Share Profile",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 5),
                itemBuilder: (context, index) {
                  return const PostGridView();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
