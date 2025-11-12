import 'package:flutter/material.dart';

// Pagina cu rândul de 3 Patients
class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Patients Ratings'),
        backgroundColor: Colors.teal,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Patients(),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Patients(),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Patients(),
            ),
          ],
        ),
      ),
    );
  }
}

// Componenta Patients
class Patients extends StatelessWidget {
  const Patients({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 44,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Label Rating & Review
          Positioned(
            left: 0,
            top: 28,
            child: Text(
              'Rating & Review',
              style: TextStyle(
                color: Color(0xFFA0A7B0),
                fontSize: 12,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
            ),
          ),
          // Valoare rating
          Positioned(
            left: 26,
            top: 0,
            child: Text(
              '4.3',
              style: TextStyle(
                color: Color(0xFF101522),
                fontSize: 16,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          ),
          // Icon stea
          Positioned(
            left: 2,
            top: 4,
            child: SizedBox(
              width: 16,
              height: 16,
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}