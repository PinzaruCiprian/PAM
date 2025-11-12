import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_state.dart';
import 'package:flutter_application_4/domain/entities/speciality_entity.dart';

class HomeSpecialities extends StatelessWidget {
  const HomeSpecialities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state is MedicineFeedLoaded) {
          final List<SpecialityEntity> specialities = state.medicineFeed.specialities;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Specialities most relevant to you',
                  style: TextStyle(
                    color: Color(0xFF171318),
                    fontSize: 16,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                    height: 1.20,
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: specialities.map((speciality) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: speciality == specialities.last ? 0 : 20,
                        ),
                        child: _SpecialityItem(
                          iconUrl: speciality.icon,
                          label: speciality.name,
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

class _SpecialityItem extends StatelessWidget {
  final String iconUrl;
  final String label;

  const _SpecialityItem({required this.iconUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: const ShapeDecoration(
            color: Color(0xFFD5F1F2),
            shape: OvalBorder(),
          ),
          child: Center(
            child: Image.network(
              iconUrl,
              width: 28,
              height: 28,
            ),
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