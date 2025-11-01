import 'package:flutter/material.dart';

class BarsPage extends StatelessWidget {
  const BarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 49.48,
      child: Stack(
        children: [
          // Background alb + shadow
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33C2C2C2),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          // Icon stânga sus (back)
          Positioned(
            left: 20,
            top: 13,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
          // Titlu
          const Positioned(
            left: 60,
            top: 12,
            child: Text(
              'Cardiologist',
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 15,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w500,
                height: 1.60,
                letterSpacing: -0.04,
              ),
            ),
          ),
          // Icon dreapta sus (notificări)
          const Positioned(
            right: 50, // puțin spre stânga pentru a face loc iconului suplimentar
            top: 15,
            child: Icon(Icons.notifications, size: 18, color: Colors.black),
          ),
          // Icon suplimentar dreapta sus (favorite)
          const Positioned(
            right: 20,
            top: 15,
            child: Icon(Icons.favorite_border, size: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
