import 'package:flutter/material.dart';

class SpecialistAppBar extends StatelessWidget {
  const SpecialistAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              '<',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Cardiologist',
            style: TextStyle(
              color: Color(0xFF374151),
              fontSize: 16,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(Icons.star_outline, size: 20, color: Colors.black),
          const SizedBox(width: 16),
          const Icon(Icons.circle_outlined, size: 20, color: Colors.black),
        ],
      ),
    );
  }
}