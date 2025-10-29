import 'package:flutter/material.dart';

class SingleDayPrayerCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        // _buildTimeSlot(label: 'Dhuhr', time: date.dhuhr),
        // _buildTimeSlot(label: 'ASR', time: data.asr, isHighlighted: true), // Highlighted one
        // _buildTimeSlot(label: 'Maghrib', time: data.maghrib),
        // _buildTimeSlot(label: 'Isha', time: data.maghrib),
        // _buildTimeSlot(label: 'Fagir', time: data.maghrib),

      ],
    );
  }

}


Widget _buildTimeSlot({
  required String label,
  required String time,
  bool isHighlighted = false
}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFC39C6B) : const Color(0xFFE5D1B8), // Example colors
        borderRadius: BorderRadius.circular(15),
        boxShadow: isHighlighted ? [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5
          )
        ] : null,
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.black54)),
          Text(
              time,
              style: TextStyle(
                fontSize: isHighlighted ? 32 : 28,
                fontWeight: FontWeight.bold,
                color: isHighlighted ? Colors.white : Colors.black,
              )
          ),
          const Text('PM', style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    ),
  );
}