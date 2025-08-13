import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/hadeth_data.dart';
import 'package:islami_app/models/sura_details_model.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName="HadethDetailsScreen";
  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  List<String>ayat=[];

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)!.settings.arguments as HadethData;

    return Scaffold(
      backgroundColor: Color(0xFF353535),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        centerTitle: true,
        title: Text(model.title,style: GoogleFonts.elMessiri(
          color: Color(0xFFE2BE7F)
              ,fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        iconTheme: IconThemeData(
          color: Color(0xFFE2BE7F)
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/soura_details_bg.png"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  indent: 64,
                  endIndent: 64,
                ),
                itemBuilder:(context, index) {
               return Container(
                 margin: EdgeInsets.symmetric(horizontal: 30,),
                 child: Text(model.content[index],
                   textAlign: TextAlign.center,
                   style: GoogleFonts.inder(

                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color: Colors.white
                 ),),
               );
              }
              ,itemCount:model.content.length ,),
            ),
          ),
        ],
      ),
    );
  }

}
