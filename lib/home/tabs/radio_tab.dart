import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage("assets/images/radio_bg.png"),
          fit: BoxFit.cover,

        ),
      ),

    );
  }
}
