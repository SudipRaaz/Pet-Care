import 'package:flutter/material.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    Color tileColor = Color.fromARGB(255, 190, 216, 252);

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Profile'),
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
                        color: Colors.black12,
                        child: Image.asset('assets/images/profiePic.png')),
                    Text(
                      'Hi, \nSudip Raj Adhikari',
                      style: MyStyle().heading2,
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
                          padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
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
                              child: Image.asset('assets/images/cat.png')),
                        ),
                        // pet name and type
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Calico',
                                style: MyStyle().heading1,
                              ),
                              Text(
                                'Breed: ',
                                style: MyStyle().subText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(40),
                    petTileWidget(
                        width: _width,
                        tileColor: tileColor,
                        heading1: 'Gender',
                        answer1: 'Female'),
                    petTileWidget(
                        width: _width,
                        tileColor: tileColor,
                        heading1: 'Age',
                        answer1: '2 Years'),
                    petTileWidget(
                        width: _width,
                        tileColor: tileColor,
                        heading1: 'Weight',
                        answer1: '12 Kg'),
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
            Text(
              heading1,
              style: MyStyle().subText,
              textAlign: TextAlign.left,
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
