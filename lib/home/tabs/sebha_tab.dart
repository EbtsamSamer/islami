
import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,

        ),
      ),

    );
  }
}
