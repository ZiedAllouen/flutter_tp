import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tp/pages/HomePage.dart';
class ViewDataPage extends StatefulWidget {
  const ViewDataPage({Key? key, required this.document,required this.id}) : super(key: key);
final Map<String,dynamic> document;
final String id;
  @override
  State<ViewDataPage> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewDataPage> {
 late TextEditingController _dishController;
  late TextEditingController _descController ;
  String Time="";
  String Tastes="";
  String type="";
  String typet="";
  bool edit= false ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String title=widget.document["title"]==null?"No title" :widget.document["title"];
    _dishController=TextEditingController(text:title);
    _descController=TextEditingController(text:widget.document["description"]);
    type=widget.document["time"];
    typet=widget.document["taste"];
  }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePage()));
      }, icon:Icon(
              CupertinoIcons.arrow_left,
              color:Colors.white,
              size:28,)
              ),
            Row  (children:[
              IconButton(onPressed: (){
              
                 
                 FirebaseFirestore.instance.collection("dishes").doc(widget.id).delete().then((value) => {
                  Navigator.pop(context)
                 });
               
      }, 
      icon:Icon(
              Icons.delete,
              color:Colors.red,
              size:28,)
              ),
                IconButton(onPressed: (){
                setState(() {
                  edit=!edit;
                });
      }, icon:Icon(
              Icons.edit,
              color:edit?Colors.green:Colors.white,
              size:28,)
              )])
              ]),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(edit?"Editing":"View",style: TextStyle(fontSize: 33,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 4),),
                  SizedBox(height: 8,),
                  Text("Your Dish",style: TextStyle(fontSize: 33,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 4),),
                  SizedBox(height: 25), 
                  label("Dish Name")  ,
                  SizedBox(height: 12),
                  tittle(), 
                  SizedBox(height: 30),   
                  label("Dish Time")  ,
                  SizedBox(height: 12),  
                  Row(children: [
                    time("Breakfast",0xff2664fa),
                    SizedBox(width: 7),
                    time("Lunch",0xff2bc89d),
                    SizedBox(width: 7),
                    time("Dinner",0xff2bc8d9),
                    ],),
                    SizedBox(height: 30),   
                  label(" Description")  ,
                  SizedBox(height: 12), 
                  Description(),
                  SizedBox(height: 30),
                  label("Tastes ")  ,
                  SizedBox(height: 12), 
                  Wrap(children: [
                    taste("Sweet",0xffcf6d6e),
                    SizedBox(width: 7),
                    taste("Sour",0xffcfed5f),
                    SizedBox(width: 7),
                    taste("Salty",0xff9be8c9),
                    SizedBox(width: 7),
                    taste("Bitter",0xff2bc89d),
                    SizedBox(width: 7),
                    taste("Umami",0xff8ec79d),
                    
                    ],
                    ),
                    SizedBox(height: 50),
                   edit? Button():Container(),
                    SizedBox(height: 30),
        ],
              ))
          ]),
        ),
      )
    );
  }
  
    Widget Button(){
      return InkWell(
        onTap: () {
          FirebaseFirestore.instance.collection("dishes").doc(widget.id).update({
            "title": _dishController.text,"time": type,  "taste": typet,"description": _descController.text
          });
          Navigator.pop(context);
        },
   child:Container (    height: 56,
        width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [Color(0xff8a32f1),Color(0xffad32f9)])
      ),
      child: Center(child: 
      Text("Update Dish",style: TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w600,
),))),
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
        controller: _descController,
        enabled: edit,
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
  Widget time(String label, int color){
    return InkWell(
      onTap: edit?() {
        setState(() {
          type=label;
        });
      }:null
      ,child:Chip(
      backgroundColor:type==label?Colors.white: Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
label,
style: TextStyle(
  color: type==label?Colors.black: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
),
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 17,vertical: 3.8,
    ),
    ))
    ;
  }

    Widget taste(String label, int color){
    return InkWell(
      onTap: edit?() {
        setState(() {
          typet=label;
        });
      }:null,
      child:Chip(
       backgroundColor:typet==label?Colors.white: Color(color),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
label,
style: TextStyle(
  color: typet==label?Colors.black:Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
),
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 17,vertical: 3.8,
    ),
    ));
  }

  Widget tittle(){
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width
      ,decoration: BoxDecoration(color:Color (0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _dishController,
        enabled: edit,
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