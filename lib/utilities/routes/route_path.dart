import 'package:pet_care/page_layout.dart';
import 'package:pet_care/utilities/routes/routes.dart';
import 'package:pet_care/view/Grooming.dart';
import 'package:pet_care/view/appointment_booking.dart';
import 'package:pet_care/view/dashboard_page.dart';
import 'package:pet_care/view/diet_planning.dart';
import 'package:pet_care/view/petWalker.dart';
import 'package:pet_care/view/medical.dart';
import 'package:pet_care/view/splash_page.dart';
import 'package:pet_care/view/terms_and_condition.dart';
import 'package:pet_care/view/user_guide_page.dart';
import 'package:flutter/material.dart';
import '../../view/login_page.dart';
import '../../view/register_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    // route setting request cases
    switch (settings.name) {
      // case;
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Splash_Screen());

      // case; requesting for login
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Register());

      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashboardPage());

      case RoutesName.pageLayout:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PageLayout());

      case RoutesName.termsAndConditions:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TermAndCondition());

      case RoutesName.userGuide:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserGuidePage());

      case RoutesName.serviceDesc:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MedicalService());

      case RoutesName.grooming:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GroomingService());

      case RoutesName.dietPlanning:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DietPlanningService());

      case RoutesName.petWalker:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PetWalkerService());

      case RoutesName.appointmentBooking:
        var arg = settings.arguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => AppointmentBooking(
                  serviceType: arg,
                ));

      // if non of these above cases are met then return this
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("no route defined")),
          );
        });
    }
  }
}
