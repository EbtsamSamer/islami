import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/azkar_model.dart';

class EveningAzkar extends StatefulWidget{
  static const String routeName="evening";

  @override
  State<EveningAzkar> createState() => _EveningAzkarState();
}

class _EveningAzkarState extends State<EveningAzkar> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
  return  Scaffold(
    backgroundColor: Colors.black,
    body:  Column(
      children: [
        FutureBuilder(
          future: AzkarModel.loadAzkarContent("أذكار المساء"),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Something went wrong",style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          AzkarModel.loadAzkarContent(
                            "أذكار المساء",
                          );
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Exit"),
                    ),
                  ],
                ),
              );
            } else {
              List<AzkarModel> azkar = snapshot.data!;
              return  ListView.builder(
                itemCount: azkar.length,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                reverse: true,
                itemBuilder: (context, index) {
                  return buildAzkarItem(
                      size,
                     azkar[index]
                  );
                },
              );
            }
          },
        ),
      ],
    ),
  );

  }

  Container buildAzkarItem(Size size, AzkarModel azkarModel) {
    return Container(
        width: size.width / 2,
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/azkar2.png"),
            fit: BoxFit.fill,
            opacity: .15,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB19768), Colors.black],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  azkarModel.count,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              azkarModel.content,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style:GoogleFonts.inter(
                  fontSize: 8,
                  fontWeight: FontWeight.normal,
                  color:Colors.black),
            ),

            Text(
              azkarModel.description,
              softWrap: true,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:GoogleFonts.inter(
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
          ]
          ,
        )
    );
  }
}