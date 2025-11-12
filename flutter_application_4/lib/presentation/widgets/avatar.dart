import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String degree;
  final String avatarUrl;

  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.degree,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF4F81FF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Dr. ',
                    style: TextStyle(
                      color: Color(0xFF101522),
                      fontSize: 20,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                  ),
                  TextSpan(
                    text: doctorName,
                    style: const TextStyle(
                      color: Color(0xFF101522),
                      fontSize: 20,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              speciality,
              style: const TextStyle(
                color: Color(0xFF357A7B),
                fontSize: 14,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                height: 1.40,
              ),
            ),
            Text(
              degree,
              style: const TextStyle(
                color: Color(0xFF8C8C8C),
                fontSize: 14,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w300,
                height: 1.40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
