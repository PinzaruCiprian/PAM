import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_state.dart';
import 'package:flutter_application_4/domain/entities/specialist_entity.dart';
import 'package:flutter_application_4/presentation/pages/specialist_detail_page.dart';

class HomeSpecialists extends StatelessWidget {
  const HomeSpecialists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state is MedicineFeedLoaded) {
          final List<SpecialistEntity> specialists = state.medicineFeed.specialists;

          return Column(
            children: [
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
              Container(
                height: 240,
                margin: const EdgeInsets.only(bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: specialists.map((specialist) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: specialist == specialists.last ? 0 : 16,
                        ),
            child: _SpecialistCard(
              name: specialist.name,
              speciality: specialist.speciality,
              imageUrl: specialist.image,
              rating: specialist.rating,
              available: specialist.available,
                          onTap: (context) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SpecialistDetailPage(),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _SpecialistCard extends StatelessWidget {
  final String name;
  final String speciality;
  final String imageUrl;
  final double rating;
  final bool available;
  final Function(BuildContext) onTap;

  const _SpecialistCard({
    required this.name,
    required this.speciality,
    required this.imageUrl,
    required this.rating,
    required this.available,
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
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFD700),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Color(0xFF18181B),
                          fontSize: 12,
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: available
                              ? const Color(0xFFECFDF5)
                              : const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          available ? 'Available' : 'Unavailable',
                          style: TextStyle(
                            color: available
                                ? const Color(0xFF059669)
                                : const Color(0xFFDC2626),
                            fontSize: 10,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
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
                child: const Icon(
                  Icons.favorite_border,
                  color: Color(0xFFE4E4E7),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
