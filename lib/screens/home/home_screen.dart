// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:post_repository/post_repository.dart';
import 'package:social_media_x/screens/profile/profile_screen.dart';
import 'package:user_repository/user_repository.dart';

import 'package:social_media_x/blocs/auth/my_user_bloc/my_user_bloc.dart';
import 'package:social_media_x/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:social_media_x/blocs/auth/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:social_media_x/blocs/post/post_bloc/post_bloc.dart';
import 'package:social_media_x/componets/sized_box.dart';
import 'package:social_media_x/screens/post/post_screen.dart';

class HomeScreen extends StatefulWidget {
  final MyUser? user;
  const HomeScreen({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
      listener: (context, state) {
        if (state is UploadPictureSuccuss) {
          setState(() {
            context.read<MyUserBloc>().state.user!.picture = state.userImage;
          });
        }
      },

      //* Scaffold
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            height * .085,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            //* Appbar
            child: appbar(context),
          ),
        ),

        //? floating action button
        floatingActionButton: BlocBuilder<MyUserBloc, MyUserState>(
          builder: (context, state) {
            if (state.status == MyUserStatus.success) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(  
                      builder: (_) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => PostBloc(
                              postRepository: FirebasePostRepository(),
                            ),
                          ),
                          BlocProvider.value(
                            value: BlocProvider.of<PostBloc>(context),
                          ),
                        ],
                        child: PostScreen(myUser: state.user!),
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.chat,
                ),
              );
            }
            return FloatingActionButton(
              onPressed: () {
                null;
              },
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
              ),
            );
          },
        ),

        //? body
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostCreateSuccess) {
              context.read<PostBloc>().add(GetPost());
            }
          },
          builder: (context, state) {
            if (state is GetPostSuccess) {
              return ListView.builder(
                itemCount: state.post.length,
                itemBuilder: (context, index) {
                  final Post post = state.post[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen(),
                                    ));
                                  },
                                  child: post.myUser.picture!.isNotEmpty
                                      ? Container(
                                          padding: const EdgeInsets.only(
                                            top: 15,
                                          ),
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                post.myUser.picture!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: const Icon(Icons.person),
                                        )),
                              kWidth10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.myUser.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd')
                                        .format(post.createdAt),
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              post.post,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetPostLoading) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            } else {
              return const Center(
                child: Text("An Error Occured"),
              );
            }
          },
        ),
      ),
    );
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: BlocBuilder<MyUserBloc, MyUserState>(
        builder: (context, state) {
          if (state.status == MyUserStatus.success) {
            return Row(
              children: [
                SizedBox(
                  child: state.user!.picture == ''
                      ? GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                              maxHeight: 500,
                              maxWidth: 500,
                              imageQuality: 40,
                            );
                            if (image != null) {
                              CroppedFile? croppedFile =
                                  await ImageCropper().cropImage(
                                sourcePath: image.path,
                                aspectRatio:
                                    const CropAspectRatio(ratioX: 1, ratioY: 1),
                                aspectRatioPresets: [
                                  CropAspectRatioPreset.square
                                ],
                                uiSettings: [
                                  AndroidUiSettings(
                                      toolbarTitle: 'Cropper',
                                      toolbarColor:
                                          Theme.of(context).colorScheme.primary,
                                      toolbarWidgetColor: Colors.white,
                                      initAspectRatio:
                                          CropAspectRatioPreset.original,
                                      lockAspectRatio: false),
                                  IOSUiSettings(
                                    title: 'Cropper',
                                  ),
                                ],
                              );
                              if (croppedFile != null) {
                                setState(
                                  () {
                                    context.read<UpdateUserInfoBloc>().add(
                                        UploadPicture(
                                            croppedFile.path,
                                            context
                                                .read<MyUserBloc>()
                                                .state
                                                .user!
                                                .id));
                                  },
                                );
                              }
                            }
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                                maxHeight: 500,
                                maxWidth: 500,
                                imageQuality: 40);
                            if (image != null) {
                              CroppedFile? croppedFile =
                                  await ImageCropper().cropImage(
                                sourcePath: image.path,
                                aspectRatio:
                                    const CropAspectRatio(ratioX: 1, ratioY: 1),
                                aspectRatioPresets: [
                                  CropAspectRatioPreset.square
                                ],
                                uiSettings: [
                                  AndroidUiSettings(
                                      toolbarTitle: 'Cropper',
                                      toolbarColor:
                                          Theme.of(context).colorScheme.primary,
                                      toolbarWidgetColor: Colors.white,
                                      initAspectRatio:
                                          CropAspectRatioPreset.original,
                                      lockAspectRatio: false),
                                  IOSUiSettings(
                                    title: 'Cropper',
                                  ),
                                ],
                              );
                              if (croppedFile != null) {
                                setState(
                                  () {
                                    context.read<UpdateUserInfoBloc>().add(
                                          UploadPicture(
                                            croppedFile.path,
                                            context
                                                .read<MyUserBloc>()
                                                .state
                                                .user!
                                                .id,
                                          ),
                                        );
                                  },
                                );
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  state.user!.picture!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                ),
                kWidth10,
                Text(
                  state.user!.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            );
          }
          return Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              kWidth10,
              const Text(
                "Loading...",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
          ),
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
          ),
        ),
      ],
    );
  }
}
