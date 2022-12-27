import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tp/Service/Auth_Service.dart';
import 'package:flutter_tp/pages/AddDish.dart';
import 'package:flutter_tp/pages/DishCard.dart';
import 'package:flutter_tp/pages/HomePage.dart';
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
  AuthClass authClass = AuthClass();
  Widget currentPage = SignUpPage();

  @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String? token = await authClass.getToken();
    print("token");
    if (token != null)
      setState(() {
        currentPage = HomePage();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}