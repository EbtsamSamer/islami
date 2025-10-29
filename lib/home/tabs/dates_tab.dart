import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/date_format.dart';
import 'package:islami_app/evening_azkar.dart';

import '../../models/azkar_model.dart';
import '../../models/prayer_time.dart';

class DatesTab extends StatefulWidget {
  const DatesTab({super.key, required this.dailyTimes});

  final List<PrayerTimes> dailyTimes;

  @override
  State<DatesTab> createState() => _DatesTabState();
}

class _DatesTabState extends State<DatesTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/time_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              FutureBuilder(
                future: ApiManager.getPrayingDate(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text("Something went wrong"),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Exit"),
                        ),
                      ],
                    );
                  } else {
                    var data = snapshot.data;
                    Map<String, dynamic> prayerTimes = data!.data!.timings!
                        .toJson();
                    return Container(
                      width: double.infinity,
                      height: size.height * .37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFF856B3F),
                        image: DecorationImage(
                          image: AssetImage("assets/images/timeBG.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  DateFormatter.fromGregorianDate(
                                    data.data!.date!.gregorian!,
                                  ),
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Pray Time",
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data.data!.date!.gregorian!.weekday!.en!,
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  DateFormatter.fromHijriDate(
                                    data.data!.date!.hijri!,
                                  ),
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CarouselSlider.builder(
                            itemCount: prayerTimes.length,
                            itemBuilder: (context, index, realIndex) {
                              return buildPrayItem(
                                size,
                                prayerTimes.keys.elementAt(index),
                                prayerTimes.values.elementAt(index),
                              );
                            },
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              enlargeFactor: 0.15,
                              viewportFraction: .25,
                              height: size.height * 0.19,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text("Next Pray - 02:32"),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),

              Text(
                "Azkar",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                spacing: 22,
                children: [
                  InkWell(
                    onTap: () {
                    Navigator.pushNamed(context, EveningAzkar.routeName);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 185,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFFE2BE7F), width: 2),
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/images/even.png"),
                          Text(
                            "Evening Azkar",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: 185,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xFFE2BE7F), width: 2),
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/images/morning.png"),
                        Text(
                          "Morning Azkar",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildPrayItem(Size size, String prayName, String prayTime) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xfff202020), Color(0xFFB19768)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            prayName,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            TimeConverter.to12Hour(prayTime),
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
