import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x33C2C2C2),
            blurRadius: 20,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 36,
            height: 36,
            decoration: const ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/profile.png"),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(),
            ),
          ),

          const SizedBox(width: 12), // gap între avatar și text

          // Nume și locație
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanvir Ahassan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                    height: 1.29,
                  ),
                ),
                Text(
                  'Mirpur, Dhaka',
                  style: TextStyle(
                    color: Color(0xFFB2BAC6),
                    fontSize: 11,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w400,
                    height: 1.64,
                  ),
                ),
              ],
            ),
          ),

          // Iconuri / butoane
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            child: const Icon(Icons.notifications_outlined, size: 24, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
