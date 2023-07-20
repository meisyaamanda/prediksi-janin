import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janin/provider/auth.dart';
import 'package:janin/provider/iconkatasandi.dart';
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
    // NamaProfilProvider namaProvider =
    //     Provider.of<NamaProfilProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
      ),
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
                    width: 220,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: labelText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // controller: namaProvider.namaProfil,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(),
                          ),
                          hintText: 'Anindira Alista',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
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
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(),
                          ),
                          hintText: 'Masukkan Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //email
                      Text(
                        'No HP',
                        style: labelText,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(),
                          ),
                          hintText: 'Masukkan Nomor HP',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No HP tidak boleh kosong';
                          }
                          return null;
                        },
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
                      Consumer<IconKataSandi>(
                        builder: (context, data, _) {
                          return TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(),
                              ),
                              hintText: 'Masukkan Kata Sandi',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  data.changeVisible(data.isvisible);
                                },
                                icon: Icon(
                                  data.isvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Kata Sandi tidak boleh kosong';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ],
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) ;
                        auth.SignUpProvider(
                          emailController.text,
                          passwordController.text,
                          context,
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
        ),
      ),
    );
  }
}
