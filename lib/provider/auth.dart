import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:janin/view/home/beranda.dart';
import 'package:janin/view/profil.dart';
import 'package:janin/view/signin/signin.dart';
import 'package:janin/view/signin/snackbar.dart';

class Auth with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Create an instance of google signin
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //Triger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Sign in the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
    return null;
  }

  void SignInProvider(String email, String password, context) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Beranda(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showTextMessage(context, 'Email tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        showTextMessage(context, 'Kata sandi yang anda masukan salah');
      }
    }
    notifyListeners();
  }

  void SignUpProvider(String email, String password, context) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showTextMessage(context, 'Akun berhasil dibuat');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showTextMessage(context, 'Kata sandi terlalu lemah');
      } else if (e.code == 'email-already-in-use') {
        showTextMessage(context, 'Akun berikut sudah terdaftar');
      }
    } catch (e) {
      return;
    }
  }

  void logOut(context) async {
    await auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignIn(),
      ),
    );
  }
}
