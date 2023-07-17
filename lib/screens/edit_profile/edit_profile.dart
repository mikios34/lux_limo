import 'dart:io';

import 'package:beyride/api/user/query.dart';
import 'package:beyride/constant.dart';
import 'package:beyride/model/user/user_model.dart';
import 'package:beyride/screens/auth/controller/user_controller.dart';
import 'package:beyride/util/loading_progress_indicator.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final UserController userController = Get.find();

  XFile? _image;

  late final Map<String, dynamic> user;
  @override
  void initState() {
    user = {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Obx(() {
                //   return

                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _image != null
                          ? CircleAvatar(
                              radius: 53.0,
                              backgroundImage: FileImage(File(_image!.path)),
                            )
                          : CircleAvatar(
                              radius: 53.0,
                              backgroundImage:
                                  userController.user!.profilePicture != null
                                      ? NetworkImage(
                                          userController.user!.profilePicture!)
                                      : null,
                            ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      onPressed: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            _image = image;
                          });
                        }
                      },
                    ),
                  ],
                ),
                // }),
                // const SizedBox(height: 16.0),
                Obx(() {
                  return Text(
                    userController.user!.email!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.6,
                        color: Colors.black),
                  );
                }),
                const SizedBox(height: 40.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.8,
                            color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 16),
                            filled: true,
                            hintText: 'First Name',
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              letterSpacing: 0.6,
                            )),
                        initialValue: userController.user!.firstName,
                        onSaved: (newValue) {
                          user['first_name'] = newValue;
                        }, // Replace with user's first name
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.8,
                            color: Colors.black),

                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 16),
                            filled: true,
                            hintText: 'Last Name',
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              letterSpacing: 0.6,
                            )),
                        initialValue: userController.user!.lastName,
                        onSaved: (newValue) {
                          user['last_name'] = newValue;
                        }, // Replace with user's last name
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26.0),
                TextFormField(
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.8,
                      color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 16),
                      filled: true,
                      hintText: 'Email Address',
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 0.6,
                      )),
                  initialValue: userController.user!.email,
                  onSaved: (newValue) {
                    user['email'] = newValue;
                  }, // Replace with user's email address
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45.0),
                Mutation(
                  options: MutationOptions(
                    onCompleted: (dynamic data) {
                      Navigator.pop(context);
                      if (data != null) {
                        userController.user =
                            User.fromJson(data['updateReservationUser']);
                        Navigator.pop(context);
                        // Use the parsed user model as needed
                      }
                    },
                    onError: (error) {
                      print("Errorrrr is $error");
                      Fluttertoast.showToast(
                        msg: 'Please try again',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                    },
                    document: gql(updateReservationUserMutation),
                  ),
                  builder: (RunMutation runMutation, QueryResult? result) {
                    return ElevatedButton(
                      onPressed: () async {
                        final form = _formKey.currentState;

                        if (form!.validate()) {
                          form.save();

                          showDialog(
                            context: context,
                            builder: (context) =>
                                LinearLoadingProgressIndicator(),
                          );
                          if (_image != null) {
                            final imageUrl =
                                await uploadImageToFirebase(_image!);
                            runMutation({
                              'userId': GetStorage().read('uid'),
                              'firstName': user['first_name'],
                              'lastName': user['last_name'],
                              'profileImage': imageUrl,
                            });
                          } else {
                            runMutation({
                              'userId': GetStorage().read('uid'),
                              'firstName': user['first_name'],
                              'lastName': user['last_name'],
                            });
                          }
                        }
                      },
                      child: const Text('Update'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> uploadImageToFirebase(XFile imageFile) async {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final storageRef = storage.ref().child('images/user_$timestamp.jpg');
    final metadata =
        firebase_storage.SettableMetadata(contentType: 'image/jpeg');

    try {
      final uploadTask = storageRef.putFile(File(imageFile.path), metadata);
      final snapshot = await uploadTask;
      if (snapshot.state == firebase_storage.TaskState.success) {
        final downloadURL = await snapshot.ref.getDownloadURL();
        return downloadURL;
      }
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
    }

    return null;
  }
}
