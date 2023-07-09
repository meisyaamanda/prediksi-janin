import 'package:flutter/material.dart';
import 'package:janin/provider/auth.dart';
import 'package:janin/theme.dart';
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
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: SafeArea(
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
          Container(
            height: 44,
            width: 325,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: pinkColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Edit Profile',
                    style: editText,
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 44,
            width: 325,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: pinkColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Edit Profile',
                    style: editText,
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 44,
            width: 325,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: pinkColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Edit Profile',
                    style: editText,
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
                  auth.logOut(context);
                },
                child: Text(
                  'Keluar',
                  style: buttonText,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
