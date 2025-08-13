import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 12),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFE2BE7F),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage("assets/images/mosq_bg.png"),fit: BoxFit.fill)
      ),
      child: Column(
        children: [
          Text(
            "Ibrahim Al-Akdar",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_up,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
