import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatesTab extends StatelessWidget {
  const DatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage("assets/images/time_bg.png"),
          fit: BoxFit.cover,

        ),
      ),


    );
  }
}
