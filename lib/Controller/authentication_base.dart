import 'package:flutter/material.dart';
import 'package:pet_care/model/registration_model.dart';

abstract class AuthenticationBase {
  Future signInWithEmailAndPassword(
      BuildContext context, String email, String password);

  // create users with email and password
  Future createUserWithEmailAndPassword(BuildContext context,
      Registration_Model registrationDetails, String password);

  // signout method
  Future signOut();

  // password reset method
  passwordReset(BuildContext context, String email);
}
