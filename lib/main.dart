import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:janin/provider/auth.dart';
import 'package:janin/view/profil.dart';
import 'package:janin/view/signin/signin.dart';
import 'package:janin/view/signup.dart';
import 'package:janin/view/splashscreen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Auth(),),
        ],
        child: Splash(),
      )
    );
  }
}