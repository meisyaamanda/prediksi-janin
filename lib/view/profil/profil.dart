import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janin/provider/auth.dart';
import 'package:janin/theme.dart';
import 'package:janin/view/profil/editprofil.dart';
import 'package:janin/view/profil/tentang.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          'Profil',
          style: appBarStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Anindira'),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfil(),
                  ),
                );
              },
              child: Container(
                height: 44,
                width: 325,
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.person,
                        color: pinkColor,
                      ),
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      Text(
                        'Edit Profile',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: blackColor),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tentang(),
                  ),
                );
              },
              child: Container(
                height: 44,
                width: 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: blackColor),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.info,
                        color: pinkColor,
                      ),
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      Text(
                        'Tentang Kami',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: blackColor),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 277,
                child: ElevatedButton.icon(
                  onPressed: () {
                    auth.logOut(context);
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Keluar',
                    style: buttonText,
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: blackColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: pinkColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
