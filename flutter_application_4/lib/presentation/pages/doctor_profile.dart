import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/doctor_details_bloc.dart';
import 'package:flutter_application_4/domain/entities/doctor_entity.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoaded) {
          final DoctorEntity doctor = state.details.doctor;

          return Row(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE8F4F4),
                  image: DecorationImage(
                    image: Image.network(
                      doctor.profileImage,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/doctor_emma.png');
                      },
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        color: Color(0xFF101522),
                        fontSize: 20,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor.speciality,
                      style: const TextStyle(
                        color: Color(0xFF357A7B),
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      doctor.qualification,
                      style: const TextStyle(
                        color: Color(0xFF8C8C8C),
                        fontSize: 14,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
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
