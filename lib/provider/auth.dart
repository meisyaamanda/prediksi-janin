import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:janin/view/home/beranda.dart';
import 'package:janin/view/home/navbar.dart';
import 'package:janin/view/profil/profil.dart';
import 'package:janin/view/signin/signin.dart';
import 'package:janin/view/signin/snackbar.dart';

class Auth with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

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
          builder: (context) => Navbar(),
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

  void SignUpProvider(String email, String password, String nama, String no, context) async {
    try {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user.user!.sendEmailVerification();
      showTextMessage(context, 'Akun berhasil dibuat');
      postDetailsToFirestore(email, nama, no, context);
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

  // void resetPassword(String email) async {
  //   if (email != "" && EmailValidator.validate(email)) {
  //     try {
  //       await auth.sendPasswordResetEmail(email: email);

  //       message = "We have sent a verification reset password to $email ";
  //     } catch (e) {
  //       // Get.defaultDialog(
  //       //   title: "Something went wrong",
  //       //   middleText: "Can't sent reset password",
  //       // );
  //     }
  //   } else {
  //     // Get.defaultDialog(
  //     //   title: "Something went wrong",
  //     //   middleText: "Invalid Email",
  //     // );
  //   }
  // }

  void logOut(context) async {
    await auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignIn(),
      ),
    );
    notifyListeners();
  }

  postDetailsToFirestore(String email, String nama, String no, context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final userData = <String, dynamic>{
      "namaController": nama,
      "emailController": email,
      "noController": no,
    };
    db.collection("users").doc(user!.uid).set(userData);
  }

  updateDetailsToFirestore(String email, String nama, String no, context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final userData = <String, dynamic>{
      "namaController": nama,
      "emailController": email,
      "noController": no,
    };
    db.collection("users").doc(user!.uid).update(userData);
    showTextMessage(context, 'Akun berhasil diupdate');
  } 
}
