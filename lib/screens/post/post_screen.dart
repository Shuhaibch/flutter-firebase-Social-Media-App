import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_repository/post_repository.dart';
import 'package:social_media_x/blocs/post/post_bloc/post_bloc.dart';
import 'package:social_media_x/componets/sized_box.dart';
import 'package:user_repository/user_repository.dart';

class PostScreen extends StatefulWidget {
  final MyUser myUser;
  const PostScreen({super.key, required this.myUser});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Post post;
  bool isMedia = false;
  File? selectedImage;
  final TextEditingController _postCtrl = TextEditingController();
  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    log(post.toString());
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        if (state is PostCreateSuccess) {
          context.read<PostBloc>().add(GetPost());

          Navigator.pop(context);
        }
        if (state is PostImageCreateSuccess) {
          context.read<PostBloc>().add(GetPost());

          Navigator.pop(context);
        }
      },
      child: Scaffold(
        //? App bar
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,

          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          //* Post Button
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 15.0,
                top: 12,
                bottom: 8,
              ),
              child: GestureDetector(
                onTap: () {
                  if (_postCtrl.text.isNotEmpty) {
                    if (selectedImage!.path.isNotEmpty) {
                      setState(() {
                        post.post = _postCtrl.text;
                      });
                      context
                          .read<PostBloc>()
                          .add(CreateImagePost(post, selectedImage!.path));
                    } else {
                      setState(
                        () {
                          post.post = _postCtrl.text;
                          // post.
                        },
                      );
                      log(post.toString(), name: 'test');
                      context.read<PostBloc>().add(CreatePost(post));
                      // context
                      //     .read<PostBloc>()
                      //     .add(CreateImagePost(post, selectedImage!.path));
                    }
                  }
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.elliptical(20, 20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Post",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

        //? Body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* PP
                      post.myUser.picture!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.only(
                                top: 15,
                              ),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.myUser.picture!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.only(
                                top: 15,
                              ),
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                // color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  // size: ,
                                ),
                              ),
                            ),
                      kWidth10,

                      //* Post Expanded
                      Expanded(
                        // Text Feild
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _postCtrl,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                hintText: "What's happening ?",
                                hintStyle:
                                    TextStyle(fontStyle: FontStyle.italic),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            kheight10,
                            isMedia
                                ? selectedImage != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            width: width * .68,
                                            height: height * .33,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: FileImage(
                                                  selectedImage!,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 5,
                                            top: 5,
                                            child: InkWell(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    selectedImage = null;
                                                    isMedia = false;
                                                  },
                                                );
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                size: 35,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : const Text("error Occured")
                                : const SizedBox(),
                            kheight10,

                            //* Media Upload Button
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              child: TextButton(
                                onPressed: () async {
                                  log('mess');
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
                                      aspectRatio: const CropAspectRatio(
                                          ratioX: 1, ratioY: 1),
                                      aspectRatioPresets: [
                                        CropAspectRatioPreset.square
                                      ],
                                      uiSettings: [
                                        AndroidUiSettings(
                                          toolbarTitle: 'Cropper',
                                          // ignore: use_build_context_synchronously
                                          toolbarColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          toolbarWidgetColor: Colors.white,
                                          initAspectRatio:
                                              CropAspectRatioPreset.original,
                                          lockAspectRatio: false,
                                        ),
                                        IOSUiSettings(
                                          title: 'Cropper',
                                        ),
                                      ],
                                    );
                                    if (croppedFile != null) {
                                      setState(
                                        () {
                                          log('message');

                                          setState(
                                            () {
                                              selectedImage =
                                                  File(croppedFile.path);
                                              isMedia = true;
                                            },
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                style: TextButton.styleFrom(
                                  elevation: 3,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    "Upload Media",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
