import 'package:flutter/material.dart';
// void main() => runApp(const DishCard());
 
class DishCard extends StatelessWidget {
  const DishCard({Key? key,required this.title,required this.iconData,required this.iconColor,required this.time,required this.iconBgColor}) : super(key: key);
 final String title;
 final IconData iconData;
 final Color iconColor;
 final String time;
 final Color iconBgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      child: Row(
        children: [
         Icon(Icons.favorite_border,
  size: 32,color: Colors.white,
  ),
  Expanded(child:Container(
    
    height: 75,
    child: Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color:Color(0xff2a2e3d),
    child: Row(children: [
      SizedBox(width: 15,),
      Container(
        height: 33,
        width: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Icon(iconData,color: iconColor,),
      ),
       SizedBox(width: 20,),
       Expanded(child: Text(title,style: TextStyle(fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.w500,color: Colors.white)
       ))
       ,
       Text(time,style: TextStyle(fontSize: 15,color: Colors.white)
       ),
       SizedBox(width: 20,),
    ])
    ,),
  ))
        ],
      ),
    );
  }
}