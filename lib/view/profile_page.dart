import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/Controller/authentication_functions.dart';
import 'package:pet_care/resource/constants/colors.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    Color tileColor = Color.fromARGB(255, 190, 216, 252);

    log('uid = ${Authentication().currentUser?.uid}');

    // stream path to remote repository
    final _userStream = FirebaseFirestore.instance
        .collection("Users")
        .doc(Authentication().currentUser?.uid)
        .get();

    return FutureBuilder(
      future: _userStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.black12,
            appBar: AppBar(
              title: const Text('Profile'),
              backgroundColor: AppColors().appBar_theme,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // evelated button
                  child: ElevatedButton(
                      // stylying button
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors().app_background,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        // auth signout
                        Authentication().signOut();
                      },
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: _height * 0.16,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child:
                                  Image.asset('assets/images/profiePic.png')),
                          addHorizontalSpace(10),
                          Expanded(
                            child: Text(
                              'Hi, \n${data['PetOwnerName']}',
                              style: MyStyle().heading2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // pet details
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // image details
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 20, 0, 0),
                                child: Container(
                                    width: 150,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 15.0,
                                            offset: Offset(0.0, 0.75))
                                      ],
                                    ),
                                    child:
                                        Image.asset('assets/images/cat.png')),
                              ),
                              // pet name and type
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 0, 12),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['PetName'],
                                        style: MyStyle().heading1,
                                      ),
                                      displayBreed(data),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(40),
                          petTileWidget(
                              width: _width,
                              tileColor: tileColor,
                              heading1: 'Gender',
                              answer1: data['PetGender']),
                          petTileWidget(
                              width: _width,
                              tileColor: tileColor,
                              heading1: 'Age',
                              answer1: '${data['Age']} Years'),
                          petTileWidget(
                              width: _width,
                              tileColor: tileColor,
                              heading1: 'Weight',
                              answer1: '${data['PetWeight']} Kg'),
                          addVerticalSpace(51)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Text displayBreed(data) {
    if (data['DogBreed'] == 'Choose') {
      return Text(
        'Breed: ${data['CatBreed']}',
        style: MyStyle().subText,
      );
    } else if (data['CatBreed'] == 'Choose') {
      return Text(
        'Breed: ${data['DogBreed']}',
        style: MyStyle().subText,
      );
    }
    return Text('empty', style: MyStyle().subText);
  }
}

class petTileWidget extends StatelessWidget {
  const petTileWidget({
    super.key,
    required double width,
    required this.tileColor,
    required this.heading1,
    required this.answer1,
  }) : _width = width;

  final double _width;
  final Color tileColor;
  final String heading1;
  final String answer1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: _width * .89,
        height: _width * .20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: tileColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54, blurRadius: 5.0, offset: Offset(2, 2))
            ]),
        // internal padding for content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  heading1,
                  style: MyStyle().subText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Text(
              answer1,
              style: MyStyle().heading1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
