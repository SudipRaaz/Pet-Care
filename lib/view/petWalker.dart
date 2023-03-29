import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/resource/components/buttons.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';

import '../utilities/routes/routes.dart';

class PetWalkerService extends StatelessWidget {
  const PetWalkerService({super.key});

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
              child: SizedBox(
                  width: _width,
                  child: Image.asset('assets/images/petWalking.png'))),
          SingleChildScrollView(
            child: Positioned(
              child: Card(
                margin: const EdgeInsets.only(top: 280.0),
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
                        'Pet Walking Services',
                        style: MyStyle().heading1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Fittness',
                        style: MyStyle().subText,
                      ),
                    ),
                    addVerticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        serviceAdsTile(
                          topHeader: 'Price',
                          centerHeader: 'Rs 200 ',
                          trailingHeader: '/hrs',
                        ),
                        serviceAdsTile(
                          topHeader: 'Expiration',
                          centerHeader: '2 ',
                          trailingHeader: 'years',
                        ),
                        serviceAdsTile(
                          topHeader: 'Rating',
                          centerHeader: '4.8 ',
                          trailingHeader: '/5',
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'About Pet Walking',
                        style: MyStyle().heading3,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'At our pet company, we understand that your busy schedule can make it difficult to give your pet the exercise they need. That\'s why we offer pet walking services to ensure that your pet stays active and healthy. Our experienced and reliable pet walkers provide a range of services, including \n -  daily walks,\n -   playtime,\n -  potty breaks. We also offer customized walking schedules to fit your pet\'s individual needs and preferences. Our goal is to provide your pet with the care and attention they deserve while you\'re away. Contact us today to schedule a pet walking appointment and give your furry friend the exercise they need.',
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
                                arguments: 'Pet Walking');
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
                color: const Color.fromARGB(31, 235, 235, 235),
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
