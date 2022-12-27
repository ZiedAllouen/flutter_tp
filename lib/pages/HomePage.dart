
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tp/Service/Auth_Service.dart';
import 'package:flutter_tp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tp/pages/AddDish.dart';
import 'package:flutter_tp/pages/DishCard.dart';
import 'package:flutter_tp/pages/SignInPage.dart';
import 'package:flutter_tp/pages/View_data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key?key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  final Stream <QuerySnapshot> _stream=FirebaseFirestore.instance.collection("dishes").snapshots();
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
  BottomNavigationBarItem(icon: Icon
  (Icons.home,size: 32,color:  Colors.white,
  ),
label: 'Home',
  ),
    BottomNavigationBarItem(
      icon:InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddTodoPage()));
        },
        child:Container(height: 52,
    width: 52,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(colors: [Colors.indigoAccent
      ,Colors.purple])
    ), child: Icon(Icons.add,
  size: 32,color: Colors.white,
  ),)
      ),
label: 'Add',
  ),
  
    BottomNavigationBarItem(
      icon:InkWell(
        onTap: ()async {
                await authClass.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => SignInPage()),
                    (route) => false);
              },
        child:Container(height: 52,
    width: 52,
     child: Icon(Icons.logout,
  size: 32,color: Colors.white,
  ),)
      ),
label: 'Logout',
  ),

]),
body:StreamBuilder<dynamic>(
  stream:_stream,
  builder:(context, snapshot) {
    if (!snapshot.hasData){
      return Center(child: CircularProgressIndicator());
    }
     return ListView.builder(
      itemCount: snapshot.data.docs.length,
      itemBuilder: (context, index) {
        late IconData iconData;
        late Color iconColor;
        Map<String,dynamic>document=
        snapshot.data.docs[index].data() as Map<String,dynamic>;
        switch(document["time"]){
          case "Breakfast": iconData=Icons.sunny;
          iconColor=Colors.yellow;
          break;
          case "Lunch": iconData=Icons.food_bank;
          iconColor=Colors.lightBlue;
          break;
          case "Dinner": iconData=Icons.mode_night;
          iconColor=Colors.black;
          break;
          default:iconData=Icons.food_bank;
          iconColor=Colors.lightBlue;
        }
       return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute
          (builder: (builder)=>ViewDataPage(document: document,
          id:snapshot.data.docs[index].id,),
          ));
        },
        child:DishCard(
        title: document['title'] ==null ? "hey":document["title"], 
       iconData: iconData, 
       iconColor: iconColor, 
       time: document['time'] ==null ? "anytime":document["time"], 
       iconBgColor: Colors.white)) ;
     }
     );
  })
    );
  }
}