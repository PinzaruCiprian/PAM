import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE8F4F4),
            image: DecorationImage(
              image: AssetImage('assets/images/doctor_emma.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Emma Kathrin',
                style: TextStyle(
                  color: Color(0xFF101522),
                  fontSize: 20,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Cardiologist',
                style: TextStyle(
                  color: Color(0xFF357A7B),
                  fontSize: 14,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'MBBS',
                style: TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}