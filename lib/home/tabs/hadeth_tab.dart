
import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage("assets/images/hadeth_bg.png"),
          fit: BoxFit.fill,

        ),
      ),

    );
  }
}
