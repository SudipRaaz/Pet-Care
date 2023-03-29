import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_care/Controller/cloud_firestore.dart';
import 'package:pet_care/model/appointment_model.dart';
import 'package:pet_care/resource/components/buttons.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';
import 'package:pet_care/utilities/InfoDisplay/message.dart';

import '../Controller/authentication_functions.dart';
import '../Controller/cloud_firestore_base.dart';

class AppointmentBooking extends StatefulWidget {
  final serviceType;
  AppointmentBooking({required this.serviceType, super.key});

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  DateTime _selectedDate = DateTime.now();

  String? selectedChip;

  List<String> chipValues = [
    '10:00 AM',
    '12:00 AM',
    '2:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Booking'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Text(
          //   ' ${widget.serviceType.toString()}, ${selectedChip}',
          //   style: MyStyle().heading4,
          // ),
          addVerticalSpace(20),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Appointment Booking Date: ',
                    style: MyStyle().heading4,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _showDatePicker();
                      },
                      child: Text(
                        'Pick a Date',
                        style: MyStyle().subSubText,
                      )),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Slots',
              style: MyStyle().heading3,
            ),
          ),
          Wrap(
            children: chipValues.map((value) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                child: FilterChip(
                  label: Text(value),
                  selected: selectedChip == value,
                  selectedColor: const Color.fromARGB(255, 129, 198, 255),
                  onSelected: (bool selected) {
                    setState(() {
                      selectedChip = selected ? value : '';
                    });
                  },
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                if (selectedChip != null) {
                  final book = Appointment_Model(
                      date: _selectedDate,
                      time: selectedChip!,
                      type: widget.serviceType,
                      location: 'Lalitpur',
                      uid: Authentication().currentUser!.uid,
                      status: 'Up Coming');

                  MyCloudStoreBase cloud = MyCloudStore();
                  cloud
                      .bookAppointment(book)
                      .onError((error, stackTrace) =>
                          Message.flutterToast(context, stackTrace.toString()))
                      .then((value) => Message.flutterToastGreen(
                          context, 'Appointment Booked'));
                } else {
                  Message.flushBarErrorMessage(
                      context, 'Please select the Time Slot');
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Confirm Appointment',
                  style: MyStyle().subText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        if (value != null) {
          _selectedDate = value;
        }
      });
    });
  }
}
