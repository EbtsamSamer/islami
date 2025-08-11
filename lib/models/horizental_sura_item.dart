import 'package:flutter/material.dart';

class HorizentalSuraItem extends StatelessWidget {
  int index;
  String nameAr;
  String nameEn;
  String numOfVerses;
  HorizentalSuraItem({super.key,required this.index,required this.nameAr,
    required this.nameEn,required this.numOfVerses});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 8,right: 8,left: 16,bottom: 8),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFE2BE7F)
      ),
      child: Row(
        children: [
          Column(children: [
            SizedBox(height: 6,),
            Text(nameEn,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black
            ),),
            SizedBox(height: 6,),
            Text(nameAr,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
                color: Colors.black
            ),),
            Text("$numOfVerses Verses",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),),


          ],),
          Image.asset("assets/images/quran_img.png"),

        ],
      ),
    );
  }
}
