import 'package:beta/providers/layout.dart';
import 'package:beta/providers/mobile_layout.dart';
import 'package:beta/providers/web_layout.dart';
import 'package:beta/templates/login.dart';
import 'package:beta/templates/register.dart';
import 'package:beta/utils/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCMvB7amtPuTmh221BEJ3-_9oCZYYlbRkQ', 
        appId: '1:584039288470:web:1b646660829309c1137cb7', 
        messagingSenderId: '584039288470', 
        projectId: 'sundae-bar',
        storageBucket: 'sundae-bar.appspot.com',
        ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sundae Bar',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
//      home: const Layout(
//        mobileScreenLayout: MobileLayout(),
//        webScreenLayout: WebLayout(),
//      ),
        home: Register(),
    );
  }
}
