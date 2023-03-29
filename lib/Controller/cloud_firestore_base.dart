import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/model/appointment_model.dart';
import 'package:pet_care/model/registration_model.dart';

abstract class MyCloudStoreBase {
  // registering user data to database
  Future registerUser(String uid, Registration_Model registrationModel);

  Future bookAppointment(Appointment_Model book);

  // get user history information
  Future statusAppointment(String docref);

  // // get user information
  // Stream<DocumentSnapshot> getData(uid) {
  //   return FirebaseFirestore.instance.collection('Users').doc(uid).snapshots();
  // }

  // Future submitFeedback(int? rating, String? comment, String? report);
}
