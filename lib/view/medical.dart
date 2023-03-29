import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/resource/components/buttons.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';
import 'package:pet_care/utilities/routes/routes.dart';

class MedicalService extends StatelessWidget {
  const MedicalService({super.key});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: (Colors.blueAccent),
      body: SafeArea(
        child: Stack(children: [
          Positioned(
              // left: 10,
              child: Container(
                  width: _width,
                  child: Image.asset('assets/images/doctor_dog.png'))),
          SingleChildScrollView(
            child: Positioned(
              child: Card(
                margin: EdgeInsets.only(top: 250.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Medical Services',
                        style: MyStyle().heading1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Veterinary',
                        style: MyStyle().subText,
                      ),
                    ),
                    addVerticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        serviceAdsTile(
                          topHeader: 'Price',
                          centerHeader: 'Rs 500 ',
                          trailingHeader: '',
                        ),
                        serviceAdsTile(
                          topHeader: 'Expiration',
                          centerHeader: '10 ',
                          trailingHeader: 'years',
                        ),
                        serviceAdsTile(
                          topHeader: 'Rating',
                          centerHeader: '4.5 ',
                          trailingHeader: '/5',
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'About Veterinarian',
                        style: MyStyle().heading3,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Our pet company offers a range of medical services to keep your furry friend healthy and happy. Our team of expert veterinarians and technicians provide the highest quality of care for your pets. Our medical services include \n -  routine check-ups, \n -  vaccinations, \n -  surgical procedures, \n -  dental cleanings.\n\n We are dedicated to providing the best care for your pets and ensuring their overall wellbeing. Contact us today to schedule an appointment and give your pet the care they deserve.',
                          style: MyStyle().subSubText,
                          textAlign: TextAlign.justify,
                        )),
                    addVerticalSpace(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons(
                          onPress: () {
                            Navigator.pushNamed(
                                context, RoutesName.appointmentBooking,
                                arguments: 'Medical');
                          },
                          text: 'Make an Appointment',
                        ),
                      ],
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 1,
            left: 10,
            child: Card(
                elevation: 7,
                color: Color.fromARGB(31, 235, 235, 235),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ))),
          ),
        ]),
      ),
    );
  }
}

class serviceAdsTile extends StatelessWidget {
  String topHeader;
  String centerHeader;
  String trailingHeader;
  serviceAdsTile(
      {super.key,
      required this.topHeader,
      required this.centerHeader,
      required this.trailingHeader});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topHeader,
            style: MyStyle().subSubText,
          ),
          addVerticalSpace(6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  centerHeader,
                  style: MyStyle().heading2,
                ),
                Text(
                  trailingHeader,
                  style: MyStyle().subSubText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
