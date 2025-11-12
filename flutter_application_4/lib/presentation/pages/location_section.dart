import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/doctor_details_bloc.dart';
import 'package:flutter_application_4/domain/entities/location_entity.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  Widget buildLocationCard(Map<String, dynamic> location) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE4E4E7), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location['area'],
            style: const TextStyle(
              color: Color(0xFF101522),
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            location['hospital'],
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoaded) {
          final List<LocationEntity> locations = state.details.locations;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                  color: Color(0xFF101522),
                  fontSize: 17,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 85,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...locations.map((loc) => [
                            buildLocationCard({'area': loc.area, 'hospital': loc.hospital}),
                            const SizedBox(width: 14),
                          ]).expand((w) => w),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
