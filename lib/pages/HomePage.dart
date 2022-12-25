import 'package:flutter_tp/Service/Auth_Service.dart';
import 'package:flutter_tp/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key?key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Dishes List",style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.white)
        ,),
      ),
bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.black87,
  items: [
  BottomNavigationBarItem(icon: Icon(Icons.home,
  size: 32,color: Colors.white,
  ),
label: 'Home',
  ),
    BottomNavigationBarItem(icon:Container(height: 52,
    width: 52,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(colors: [Colors.indigoAccent
      ,Colors.purple])
    ), child: Icon(Icons.add,
  size: 32,color: Colors.white,
  ),),
    
label: 'Add',
  ),
  
  BottomNavigationBarItem(icon: Icon(Icons.logout,
  size: 32,color: Colors.white,
  )
  , label: 'Logout',
  )
]),
body:SingleChildScrollView(child: Container(),)
    );
  }
}