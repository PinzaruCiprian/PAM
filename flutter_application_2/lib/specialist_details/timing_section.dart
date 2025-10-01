import 'package:flutter/material.dart';

class TimingSection extends StatelessWidget {
  const TimingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Timing',
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 17,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 85,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTimingCard('Monday', '09:00 AM - 05:00 PM'),
                const SizedBox(width: 14),
                _buildTimingCard('Tuesday', '09:00 AM - 05:00 PM'),
                const SizedBox(width: 14),
                _buildTimingCard('Wednesday', '10:00 AM - 06:00 PM'),
                const SizedBox(width: 14),
                _buildTimingCard('Thursday', '09:00 AM - 05:00 PM'),
                const SizedBox(width: 14),
                _buildTimingCard('Friday', '09:00 AM - 03:00 PM'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimingCard(String day, String time) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE4E4E7), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Color(0xFF101522),
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            time,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 13,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}