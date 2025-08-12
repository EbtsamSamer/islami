import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/hadeth_data.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethData> HadethDetails = [];

  @override
  Widget build(BuildContext context) {
    loadHadethFile();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(height: double.infinity),
        items: HadethDetails.map((hadeth) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: 618,
                width: 316,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      "assets/images/hadith_card.png",
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            '${hadeth.title}',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,left: 25,right: 25),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Text(
                                  '${hadeth.content[index]}',
                                  style: GoogleFonts.elMessiri(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                              itemCount: hadeth.content.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Future<void> loadHadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allAhadeth = hadethFile.split("#");
    for (var hadeth in allAhadeth) {
      List<String> hadethLines = hadeth.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      HadethData hadethModel = HadethData(title, content);
      print(title);
      HadethDetails.add(hadethModel);
    }
    setState(() {});
  }
}
