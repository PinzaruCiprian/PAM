import 'package:flutter/material.dart';

class HomeSpecialities extends StatelessWidget {
  const HomeSpecialities({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titlu - fără spațiu de sus, doar jos 10
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Group1707477986(),
        ),

        // Row cu 4 elemente fără padding lateral, fără spațiu de sus, doar jos 10
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 90,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Group1707478027(icon: Icons.visibility, label: 'Eye Specialist'),
                  SizedBox(width: 20),
                  Group1707478027(icon: Icons.medical_services, label: 'Dentist'),
                  SizedBox(width: 20),
                  Group1707478027(icon: Icons.favorite, label: 'Cardiologist'),
                  SizedBox(width: 20),
                  Group1707478027(icon: Icons.air, label: 'Pulmonologist'),
                  SizedBox(width: 20),
                  Group1707478027(icon: Icons.psychology, label: 'Neurologist'),
                  SizedBox(width: 20),
                  Group1707478027(icon: Icons.child_care, label: 'Pediatrician'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Group1707477986 extends StatelessWidget {
  const Group1707477986({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Specialities most relevant to you',
      style: TextStyle(
        color: Color(0xFF171318),
        fontSize: 16,
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w600,
        height: 1.20,
      ),
    );
  }
}

// Modificat să accepte un icon
class Group1707478027 extends StatelessWidget {
  final IconData icon;
  final String label;

  const Group1707478027({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cercul principal
        Container(
          width: 54,
          height: 54,
          decoration: const ShapeDecoration(
            color: Color(0xFFD5F1F2),
            shape: OvalBorder(),
          ),
          child: Center(
            child: Icon(icon, color: const Color(0xFF357A7B), size: 28),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w700,
            height: 1.20,
          ),
        ),
      ],
    );
  }
}
