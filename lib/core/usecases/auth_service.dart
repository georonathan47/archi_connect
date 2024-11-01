// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../shared/user.dart';
// import 'package:seven_columns/core/shared/user.dart';

class AuthService {
  final FlutterAppAuth _flutterAppAuth = FlutterAppAuth();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  //! Create a user obj based on FirebaseUser
  Person? _userFromFirebaseUser(user) {
    return user != null ? Person(uid: user.uid) : null;
  }

  //! auth change user stream
  Stream<Person>? get user {
    // return _auth.authStateChanges().map(_userFromFirebaseUser);
    //return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    return null;
  }

  //! register with email and password
  // Future registerEmailandPassword(String email, String password) async {
  //   try {
  //     //! changed from AuthResult to UserCredential
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User person = result.user;

  //     // create a  document in the database for the user with the uid
  //     // await DatabaseService(uid: person.uid).updateUserData(
  //     //   "7Columns", //! dummy data
  //     //   "$email",
  //     //   "********",
  //     //   233,
  //     // );
  //     return _userFromFirebaseUser(person);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "weak-password") {
  //       print("");
  //     } else if (e.code == "email-already-in-use") {
  //       print('Account already in use');
  //     } else {
  //       print('An unknown error has occurred!\t\t\t Please try again later!');
  //     }
  //     return null;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // //! sign in with email and password
  // Future signInWithEmailandPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     User person = result.user; //changedfrom FirebaseUser to User
  //     return _userFromFirebaseUser(person);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found") {
  //       print("No user found! \nTry creating a  Account!");
  //     } else if (e.code == "wrong-password") {
  //       print(
  //           'Invalid password provided... \nPlease try again with valid credentials');
  //     } else {
  //       print('An unknown error has occurred!\n Please try again later!');
  //     }
  //     return null;
  //   }
  // }

  //! sign out
  Future logout() async {
    try {
      // return await _flutterAppAuth.;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
