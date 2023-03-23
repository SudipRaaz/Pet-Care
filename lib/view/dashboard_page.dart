import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Controller/authentication_base.dart';
import '../Controller/authentication_functions.dart';
import '../resource/constants/colors.dart';
import '../utilities/InfoDisplay/message.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController requestService = TextEditingController();
  bool checkAmbulance = false;
  bool checkFireBrigade = false;
  bool checkPolice = false;
  double latitude = 0;
  double longitude = 0;

  @override
  Widget build(BuildContext context) {
    // setting available height and width
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('dashboard page'),
      ),
    );
  }
}
