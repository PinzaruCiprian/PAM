import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/doctor_details_bloc.dart';
import 'package:flutter_application_4/domain/entities/timing_entity.dart';

class TimingSection extends StatelessWidget {
  const TimingSection({super.key});

  Widget buildTimingCard(Map<String, dynamic> timing) {
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
            timing['day'],
            style: const TextStyle(
              color: Color(0xFF101522),
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            timing['time'],
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 13,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
            ),
          ),
          if (timing['slots'] != null) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE1F6F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${timing['slots'].length} slots',
                style: const TextStyle(
                  color: Color(0xFF357A7B),
                  fontSize: 10,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoaded) {
          final List<TimingEntity> timing = state.details.timing;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Timing',
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
                      ...timing.map((t) => [
                            buildTimingCard({'day': t.day, 'time': t.time}),
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
