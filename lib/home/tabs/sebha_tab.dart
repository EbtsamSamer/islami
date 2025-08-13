import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {

   SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;

  List<String>azqar=[
    "سبحان الله",
    "الحمد الله",
    " الله أكبر ",
    "لا اله الا الله",
    "لا حول ولا قوه الا بالله",
  ];

  double angle=0;

  int index=0;

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.sizeOf(context);
    return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/sebha_bg.png"),
        fit: BoxFit.cover,
      ),
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: GoogleFonts.eastSeaDokdo(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Colors.white,
            ),
          ),
          Stack(
              alignment: Alignment.topCenter,

              children:[ Image.asset("assets/images/sebha_tail.png"),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Stack(
                alignment: Alignment.center,
                children: [

                  GestureDetector(
                    onTap: () {
                      onClick();
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Transform.rotate(
                          angle: angle,
                          child: Image.asset("assets/images/sebha_body.png")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: screenSize.width*0.7,
                      child: Column(
                        children: [
                          Text(
                            azqar[index],
                            style: GoogleFonts.saira(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "$counter",
                            style: GoogleFonts.saira(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ]),

        ],
      ),
    );
  }

  onClick(){
    counter++;
    angle+=20;
    if(counter==34){
      index=index+1;
      counter=0;
    }
    if(index==azqar.length){
      index=0;
    }

  }
}
