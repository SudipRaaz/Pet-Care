import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/utilities/routes/routes.dart';
import '../resource/constants/colors.dart';
import '../resource/constants/style.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // setting available height and width
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Page'),
          backgroundColor: AppColors().appBar_theme,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(10),
              Center(
                child: Container(
                  // clipBehavior: Clip.antiAlias,
                  width: _width - 30,
                  height: _height * .3,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/promo2.png'))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 20),
                child: Text(
                  "Services",
                  style: MyStyle().boldHeading,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.serviceDesc);
                    },
                    child: ServiceTile(_width, Icons.medical_services_outlined,
                        'Medical Services'),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.grooming);
                      },
                      child: ServiceTile(
                          _width, Icons.cut_sharp, 'Grooming Services')),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.dietPlanning);
                    },
                    child: ServiceTile(_width, Icons.local_restaurant_outlined,
                        'Diet Planning Services'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.petWalker);
                    },
                    child: ServiceTile(
                        _width, Icons.pets_outlined, ' Pet Walker Services'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Padding ServiceTile(double width, IconData icons, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 0, 12),
      child: Container(
        width: width * .45,
        height: width * .45,
        decoration: BoxDecoration(
            color: AppColors().service_tile_color,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // addVerticalSpace(15),
            Icon(
              icons,
              size: 110,
              color: Colors.white,
            ),
            Text(
              text,
              style: MyStyle().serviceTile,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
