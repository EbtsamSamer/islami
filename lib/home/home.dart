import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/dates_tab.dart';
import 'package:islami_app/home/tabs/hadeth_tab.dart';
import 'package:islami_app/home/tabs/quran_tab.dart';
import 'package:islami_app/home/tabs/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Color(0xFFE2BE7F),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },

          items: [
            BottomNavigationBarItem(
              icon: _buildImage("ic_quran", 0),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: _buildImage("ic_ahadeth", 1),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              icon: _buildImage("ic_sepha", 2),
              label: "Sepha",
            ),
            BottomNavigationBarItem(
              icon: _buildImage("ic_radio", 3),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              icon: _buildImage("ic_time", 4),
              label: "Date",
            ),
          ],
        ),
body: tabs[currentIndex],
      ),
    );
  }

  _buildImage(String name, int index) {
    return index == currentIndex
        ? Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
            height: 36,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: Color(0xFF202020).withOpacity(0.6),
            ),

            child: ImageIcon(AssetImage("assets/images/$name.png"),size: 20,),
          )
        : ImageIcon(AssetImage("assets/images/$name.png"));
  }
  List<Widget>tabs=[
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    DatesTab()
  ];
}
