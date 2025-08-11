import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraItem extends StatelessWidget {
  int index;
  String nameAr;
  String nameEn;
  String numOfVerses;
  SuraItem({super.key,required this.index,required this.nameAr,
  required this.nameEn,required this.numOfVerses});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
       alignment: Alignment.center,
         children: [
           Image.asset("assets/images/index_ic.png",height: 54,width: 54,),
           Text("$index",style: GoogleFonts.inter(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.white,
           ),),
         ],
        ),
        SizedBox(width: 24,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameEn,style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
              Text("$numOfVerses Verses",style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ],
          ),
        ),


        Text(nameAr,style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ],
    );
  }
}
