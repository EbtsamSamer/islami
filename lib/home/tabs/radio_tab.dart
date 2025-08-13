import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/radio_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF202020).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Color(0xFFE2BE7F),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  dividerColor: Colors.transparent,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  tabs: [
                    Tab(text: "Radio"),
                    Tab(text: "Reciters"),
                  ],
                ),
              ),
             SizedBox(height: 10,),
             Container(
               width: double.infinity,
               height: screenSize.height*0.6,
               child: TabBarView(children: [
               ListView.builder(itemBuilder: (context, index) =>   RadioItem(),),
                 ListView.builder(itemBuilder: (context, index) =>   RadioItem(),),

               ]),
             )


            ],
          ),
        ),
      ),
    );
  }
}
