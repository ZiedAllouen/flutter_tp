import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff1d1e26),
            Color(0xff252041),
          ])
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 30,),
            IconButton(onPressed: (){}, icon:Icon(
              CupertinoIcons.arrow_left,
              color:Colors.white,
              size:28,)
              ),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create",style: TextStyle(fontSize: 33,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 4),),
                  SizedBox(height: 8,),
                  Text("New Dish",style: TextStyle(fontSize: 33,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 4),),
                  SizedBox(height: 25), 
                  label("Dish Name")  ,
                  SizedBox(height: 12),
                  tittle(), 
                  SizedBox(height: 30),   
                  label("Dish Time")  ,
                  SizedBox(height: 12),  
                  Row(children: [
                    chipData("Breakfast",0xff2664fa),
                    SizedBox(width: 7),
                    chipData("Lunch",0xff2bc89d),
                    SizedBox(width: 7),
                    chipData("Dinner",0xff2bc8d9),
                    ],),
                    SizedBox(height: 30),   
                  label(" Description")  ,
                  SizedBox(height: 12), 
                  Description(),
                  SizedBox(height: 30),
                  label("Tastes ")  ,
                  SizedBox(height: 12), 
                  Wrap(children: [
                    chipData("Sweet",0xffcf6d6e),
                    SizedBox(width: 7),
                    chipData("Sour",0xffcfed5f),
                    SizedBox(width: 7),
                    chipData("Salty",0xff9be8c9),
                    SizedBox(width: 7),
                    chipData("Bitter",0xff2bc89d),
                    SizedBox(width: 7),
                    chipData("Umami",0xff8ec79d),
                    
                    ],
                    ),
                    SizedBox(height: 50),
                    Button(),
                    SizedBox(height: 30),
        ],
              ))
          ]),
        ),
      )
    );
  }
  
    Widget Button(){
      return Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [Color(0xff8a32f1),Color(0xffad32f9)])
      ),
      child: Center(child: Text("Add New Dish",style: TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w600,
),)),
      );
    }
    Widget Description(){
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width
      ,decoration: BoxDecoration(color:Color (0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.grey,
        fontSize: 17),
        maxLines: null,
        decoration: InputDecoration(border: InputBorder.none 
         ,hintText: "Dish Description",
        hintStyle: TextStyle(color: Colors.grey,
        fontSize: 17),
        contentPadding: EdgeInsets.only(
          left:20,
          right: 20,
        )
        ),
      ),
      );
    
  }
  Widget chipData(String label, int color){
    return Chip(
      backgroundColor: Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
label,
style: TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
),
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 17,vertical: 3.8,
    ),
    );
  }
  Widget tittle(){
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width
      ,decoration: BoxDecoration(color:Color (0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.grey,
        fontSize: 17),
        decoration: InputDecoration(border: InputBorder.none 
         ,hintText: "Dish Name",
        hintStyle: TextStyle(color: Colors.grey,
        fontSize: 17),
        contentPadding: EdgeInsets.only(
          left:20,
          right: 20,
        )
        ),
      ),
      );
    
  }
  Widget label(String label){
return Text(
  label,
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.w600,letterSpacing: 0.2,fontSize: 16.5,),);
               
  }
}