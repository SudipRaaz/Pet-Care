import 'package:pet_care/model/appointment_model.dart';
import 'package:pet_care/model/registration_model.dart';

abstract class MyCloudStoreBase {
  // registering user data to database
  Future registerUser(String uid, Registration_Model registrationModel);

  // booking appointment
  Future bookAppointment(Appointment_Model book);

  // get user history information
  Future statusAppointment(String docref, String status);
}
