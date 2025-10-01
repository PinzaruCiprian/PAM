import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Câmp de căutare cu icon în stânga
        Expanded(
          child: Container(
            height: 44,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Row(
              children: [
                Icon(Icons.search, color: Color(0xFFBDBDBD), size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Search...',
                    style: TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontSize: 14,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w300,
                      height: 1.29,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Buton lateral (optional)
        Container(
          width: 44,
          height: 44,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Icon(Icons.qr_code_scanner_outlined, color: Color(0xFFBDBDBD)),
        ),
      ],
    );
  }
}
