import 'package:flutter/material.dart';
import '../specialist_details.dart';

// Icon pentru "love"
class ButtonLove extends StatelessWidget {
  const ButtonLove({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      padding: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE4E4E7)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Icon(Icons.favorite_border,
          color: Color(0xFFE4E4E7), size: 20),
    );
  }
}

// Widget principal cu carduri
class HomeSpecialists extends StatelessWidget {
  const HomeSpecialists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Titlu și buton "View all"
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Specialists',
                style: TextStyle(
                  color: Color(0xFF171318),
                  fontSize: 16,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                  height: 1.20,
                ),
              ),
              Text(
                'View all >',
                style: TextStyle(
                  color: Color(0xFF357A7B),
                  fontSize: 13,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  height: 1.54,
                ),
              ),
            ],
          ),
        ),

        // Carduri în carousel
        Container(
          height: 240,
          margin: const EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _SpecialistCard(
                  name: 'Dr. Ahmed Khan',
                  speciality: 'General Practitioners',
                  price: '300',
                  imageUrl: 'assets/images/dr_ahmed_khan.png',
                  onTap: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpecialistDetailPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                _SpecialistCard(
                  name: 'Dr. Warner Miller',
                  speciality: 'General Practitioners',
                  price: '300',
                  imageUrl: "assets/images/dr_warner_miller.png",
                  onTap: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpecialistDetailPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                _SpecialistCard(
                  name: 'Dr. Emma Smith',
                  speciality: 'Cardiologist',
                  price: '350',
                  imageUrl: "assets/images/dr_ahmed_khan.png",
                  onTap: (context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpecialistDetailPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Card reutilizabil pentru specialiști
class _SpecialistCard extends StatelessWidget {
  final String name;
  final String speciality;
  final String price;
  final String imageUrl;
  final Function(BuildContext) onTap;

  const _SpecialistCard({
    required this.name,
    required this.speciality,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        width: 200,
        height: 244.68,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE4E4E7)),
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x05000000),
              blurRadius: 40,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagine
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Speciality
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    speciality,
                    style: const TextStyle(
                      color: Color(0xFF71717A),
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      height: 1.70,
                      letterSpacing: 0.20,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF18181B),
                      fontSize: 12,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      height: 1.70,
                      letterSpacing: 0.20,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Linie separator
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    height: 1,
                    color: const Color(0xFFE4E4E7),
                  ),
                ),
                const SizedBox(height: 8),
                // Preț
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: '৳',
                          style: TextStyle(
                            color: Color(0xFF18181B),
                            fontSize: 18,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                        TextSpan(
                          text: price,
                          style: const TextStyle(
                            color: Color(0xFF18181B),
                            fontSize: 18,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 8,
              left: 8,
              child: ButtonLove(),
            ),
          ],
        ),
      ),
    );
  }
}
