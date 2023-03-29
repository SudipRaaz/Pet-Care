import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/Controller/cloud_firestore_base.dart';
import 'package:pet_care/model/appointment_model.dart';
import 'package:pet_care/model/registration_model.dart';

class MyCloudStore extends MyCloudStoreBase {
  @override
  Future registerUser(String uid, Registration_Model registrationModel) async {
    {
      final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);

      // wating for doc set josn object on firebase
      await docUser.set(registrationModel.toJson());
    }
  }

  @override
  Future bookAppointment(Appointment_Model book) async {
    final bookAppointment =
        FirebaseFirestore.instance.collection('Appointments').doc();

    // wating for doc set josn object on firebase
    await bookAppointment.set(book.toJson());
  }

  @override
  Future statusAppointment(String docref) async {
    final bookAppointment =
        FirebaseFirestore.instance.collection('Appointments').doc(docref);

    // wating for doc set josn object on firebase
    await bookAppointment.update(
      {"Status": 'Cancelled'},
    );
  }
}
