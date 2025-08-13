import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth_details_screen.dart';
import 'package:islami_app/home/home.dart';
import 'package:islami_app/home/onboardingScreen.dart';

import 'home/sura_details_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        OnboardingScreen.routeName:(context)=>OnboardingScreen(),
       HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
      },

    );
  }
}
