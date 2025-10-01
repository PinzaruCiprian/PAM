import 'package:flutter/material.dart';

class HomeServicesGrid extends StatelessWidget {
  const HomeServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Primul rând: două elemente (50/50)
        Row(
          children: [
            Expanded(child: Group1707478004()),
            SizedBox(width: 8), // gap între coloane
            Expanded(child: Group1707478003()),
          ],
        ),

        SizedBox(height: 16), // spațiu între rânduri

        // Al doilea rând: trei elemente (33/33/33)
        Row(
          children: [
            Expanded(child: Group1707478002()),
            SizedBox(width: 8),
            Expanded(child: Group1707478005()),
            SizedBox(width: 8),
            Expanded(child: Group1707478007()),
          ],
        ),
      ],
    );
  }
}

// 🔹 Box mare (50%)
class Group1707478004 extends StatelessWidget {
  const Group1707478004({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LargeBox(
      imageUrl: 'assets/images/book_appointment.png',
      label: "Book Appointment",
    );
  }
}

class Group1707478003 extends StatelessWidget {
  const Group1707478003({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LargeBox(
      imageUrl: 'assets/images/video_consult.png',
      label: "Instant Video Consult",
    );
  }
}

// 🔹 Box mici (33%)
class Group1707478002 extends StatelessWidget {
  const Group1707478002({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SmallBox(
      imageUrl: 'assets/images/medicines.png',
      label: "Medicines",
    );
  }
}

class Group1707478005 extends StatelessWidget {
  const Group1707478005({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SmallBox(
      imageUrl: 'assets/images/lab_tests.png',
      label: "Lab Tests",
    );
  }
}

class Group1707478007 extends StatelessWidget {
  const Group1707478007({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SmallBox(
      imageUrl: 'assets/images/emergency.png',
      label: "Emergency",
    );
  }
}

// 🔹 Reutilizare: box mare (50%)
class _LargeBox extends StatelessWidget {
  final String imageUrl;
  final String label;

  const _LargeBox({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF1F1F1), width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 31,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Reutilizare: box mic (33%)
class _SmallBox extends StatelessWidget {
  final String imageUrl;
  final String label;

  const _SmallBox({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF1F1F1), width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 31,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
