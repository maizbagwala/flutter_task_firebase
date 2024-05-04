import 'package:firebase_auth/firebase_auth.dart';


class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserCredential?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
