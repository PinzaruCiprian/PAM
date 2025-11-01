import 'package:flutter/material.dart';

class IphoneXBarsStatusDefault extends StatelessWidget {
  const IphoneXBarsStatusDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ora
          const Text(
            '9:41',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.17,
            ),
          ),

          const Spacer(),

          // Signal strength icon
          const Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
          const SizedBox(width: 4),
          
          // WiFi icon
          const Icon(Icons.wifi, size: 16, color: Colors.black),
          const SizedBox(width: 4),

          // Battery indicator
          Container(
            width: 18,
            height: 7.67,
            decoration: ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
