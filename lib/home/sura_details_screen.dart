import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_details_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName="SuraDetailsScreen";
   SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String>ayat=[];

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)!.settings.arguments as SuraDetailsModel;
    if(ayat.isEmpty) {
      loadSureFile(model.index);
    }
    return Scaffold(
      backgroundColor: Color(0xFF353535),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        centerTitle: true,
        title: Text(model.nameEN,style: GoogleFonts.elMessiri(
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(model.nameAR,style: GoogleFonts.elMessiri(
                    color: Color(0xFFE2BE7F)
                    ,fontSize: 24,
                    fontWeight: FontWeight.bold
                    ),),
              ),
              SizedBox(height:40,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    indent: 64,
                    endIndent: 64,
                  ),
                  itemBuilder:(context, index) {
                 return Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.symmetric(horizontal: 30),
                   child: Text(ayat[index],
                     textAlign: TextAlign.center,
                     style: GoogleFonts.inder(

                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                     color: Colors.white
                   ),),
                 );
                }
                ,itemCount:ayat.length ,),
              )
            ],
          ),
        ],
      ),
    );
  }

  loadSureFile(int index)async{
  String suraFile=await rootBundle.loadString("assets/files/$index.txt");
   List<String> suraLines=suraFile.split("\n");
   ayat=suraLines;
   setState(() {

   });
   print(suraLines) ;

  }
}
