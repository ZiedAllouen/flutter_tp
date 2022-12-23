  import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tp/pages/SignUpPage.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key?key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  void signup() async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: "zied@gmail.com", password: "123");
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: SignUpPage());
  }
}