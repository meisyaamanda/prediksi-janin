import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janin/view/signin/signin.dart';
import '../theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  fontSize: 22,
                ),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
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
            Text(
              'Nama Lengkap',
              style: labelText,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(),
                ),
                hintText: 'Masukkan Kata Sandi',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 50,),
            //Button
            Center(
              child: Container(
                width: 277,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: pinkColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
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
                    child: Text('Sudah Punya Akun?',
                        style: GoogleFonts.poppins(fontSize: 12)),
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
      )),
    );
  }
}
