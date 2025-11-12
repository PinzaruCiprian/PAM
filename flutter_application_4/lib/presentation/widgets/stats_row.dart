import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/doctor_details_bloc.dart';
import 'package:flutter_application_4/domain/entities/doctor_entity.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
      builder: (context, state) {
            if (state is DoctorDetailsLoaded) {
              final DoctorEntity doctor = state.details.doctor;
          
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildStatItem(
                      Icons.star,
                      doctor.rating.toString(),
                      'Rating & ${doctor.reviewsCount} Reviews',
                      Colors.amber
                ),
              ),
              Expanded(
                child: _buildStatItem(
                      Icons.work_outline,
                      doctor.yearsOfExperience.toString(),
                      'Years of work',
                      const Color(0xFF357A7B)
                ),
              ),
              Expanded(
                child: _buildStatItem(
                      Icons.people_outline,
                      doctor.patientsTreated.toString(),
                      'No. of patients',
                      const Color(0xFF357A7B)
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, Color iconColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF101522),
                fontSize: 16,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFA0A7B0),
            fontSize: 11,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
