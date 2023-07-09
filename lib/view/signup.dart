import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janin/provider/auth.dart';
import 'package:janin/view/signin/signin.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);
    final _formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Daftar Akun',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: pinkColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Masukkan data dibawah ini untuk mempunyai akun',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 204,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: blackColor, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      auth.signInWithGoogle();
                    },
                    child: Text(
                      'Masuk dengan Google',
                      style: buttonText,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //namalengkap
              Form(
                key: _formKey,
                child: Text(
                  'Nama Lengkap',
                  style: labelText,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Anindira Alista',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //email
              Text(
                'Email',
                style: labelText,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Masukkan Email / Nomor HP',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Kata Sandi
              Text(
                'Kata Sandi',
                style: labelText,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(),
                  ),
                  hintText: 'Masukkan Kata Sandi',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //Button
              Center(
                child: Container(
                  width: 277,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: blackColor,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: pinkColor,
                    ),
                    onPressed: () {
                      auth.SignUpProvider(emailController.text,
                          passwordController.text, context);
                    },
                    child: Text(
                      'Daftar',
                      style: buttonText,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Sudah Punya Akun?',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Masuk',
                      style: buttonlabelText.copyWith(
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
