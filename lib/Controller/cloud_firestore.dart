import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/Controller/cloud_firestore_base.dart';
import 'package:pet_care/model/registration_model.dart';

class MyCloudStore extends MyCloudStoreBase {
  @override
  Future registerUser(String uid, Registration registrationModel) async {
    {
      final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);

      // wating for doc set josn object on firebase
      await docUser.set(registrationModel.toJson());
    }
  }
}
