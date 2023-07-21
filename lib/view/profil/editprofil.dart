import 'package:flutter/material.dart';

import '../../theme.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
        title: Text('Edit Profil', style: appBarStyle,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Edit Profil'),
        ),
      ),
    );
  }
}