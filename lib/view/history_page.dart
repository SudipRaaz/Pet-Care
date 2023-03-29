import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_care/Controller/authentication_functions.dart';
import 'package:pet_care/resource/constants/colors.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';

import '../Controller/cloud_firestore.dart';
import '../Controller/cloud_firestore_base.dart';
import '../utilities/InfoDisplay/message.dart';

class HistoryPage extends StatelessWidget {
  List appointmentLog = [];
  // List documentID = [];

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _appointments = FirebaseFirestore.instance
        .collection('Appointments')
        .where('uid', isEqualTo: Authentication().currentUser!.uid)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().appBar_theme,
        title: const Text('Appointment'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _appointments,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if (snapshot.hasData) {
            appointmentLog = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map a = document.data() as Map<String, dynamic>;
              a['id'] = document.id;
              // add the documentID of the notification data
              appointmentLog.add(a);
            }).toList();

            return SizedBox(
                height: _height,
                width: _width,
                child: ListView.builder(
                  itemBuilder: (conxtext, index) {
                    Timestamp timestamp = appointmentLog[index]['Date'];
                    DateTime dateTime = timestamp.toDate();
                    log('${appointmentLog[index]['id']}');
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.amber,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Date ',
                                        style: MyStyle().subText,
                                      ),
                                      Text(
                                        '${dateTime.year}/${dateTime.month}/${dateTime.day}',
                                        style: MyStyle().subText,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Time',
                                        style: MyStyle().subText,
                                      ),
                                      Text(
                                        appointmentLog[index]['Time'],
                                        style: MyStyle().subText,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Status',
                                        style: MyStyle().subText,
                                      ),
                                      Text(
                                        appointmentLog[index]['Status'],
                                        style: MyStyle().subText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              addVerticalSpace(15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Type',
                                        style: MyStyle().subText,
                                      ),
                                      Text(
                                        '${appointmentLog[index]['Type']} \n Service',
                                        style: MyStyle().subText,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Location',
                                        style: MyStyle().subText,
                                      ),
                                      Text(
                                        appointmentLog[index]['Location'],
                                        style: MyStyle().subText,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            MyCloudStoreBase cloud =
                                                MyCloudStore();

                                            cloud
                                                .statusAppointment(
                                                    appointmentLog[index]['id'])
                                                .onError((error, stackTrace) =>
                                                    Message.flutterToast(
                                                        context,
                                                        stackTrace.toString()))
                                                .then((value) =>
                                                    Message.flutterToastGreen(
                                                      context,
                                                      'Appointment Cancelled',
                                                    ));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          child: const Text('Cancel'))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: appointmentLog.length,
                ));
          }
          ;
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
