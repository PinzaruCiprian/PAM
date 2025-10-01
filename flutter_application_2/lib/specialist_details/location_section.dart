import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
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
                _buildLocationCard('Shahbag', 'BSMMU - Bangabandh...'),
                const SizedBox(width: 14),
                _buildLocationCard('Boshundhora', 'Evercare Hospital Ltd'),
                const SizedBox(width: 14),
                _buildLocationCard('Dhanmondi', 'Popular Medical Col...'),
                const SizedBox(width: 14),
                _buildLocationCard('Gulshan', 'United Hospital Limited'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationCard(String title, String subtitle) {
    return Container(
      width: 200,
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
            title,
            style: const TextStyle(
              color: Color(0xFF101522),
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}