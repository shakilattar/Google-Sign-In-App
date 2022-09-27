import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quantum_app/model/user_details.dart';

class LoginController with ChangeNotifier {
  //object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  //function for google sign in
  googleLogin() async {
    this.googleSignInAccount = await _googleSignIn.signIn();
    //inserting values to our userdetails model

    this.userDetails = UserDetails(
        displayName: googleSignInAccount!.displayName,
        email: googleSignInAccount!.email,
        photoUrl: googleSignInAccount!.photoUrl);
    notifyListeners();
  }

  //function for logout
  logout() async {
    this.googleSignInAccount = await _googleSignIn.signOut();
    userDetails = null;
    notifyListeners();
  }
}
