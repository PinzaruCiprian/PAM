import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/doctor_details_bloc.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  String _selectedDate = 'Today';
  String? _selectedTimeSlot;

  Widget buildHeader(Map<String, dynamic> appointment) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const ShapeDecoration(
        color: Color(0xFFE1F6F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appointment['type'],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w700,
              height: 1.54,
              letterSpacing: -0.08,
            ),
          ),
          Text(
            '${appointment['currency']}${appointment['fee']}',
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF357A7B),
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
              height: 1.33,
              letterSpacing: -0.08,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHospitalInfo(Map<String, dynamic> hospital) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hospital['name'],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
              height: 1.33,
              letterSpacing: -0.08,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                hospital['location'],
                style: const TextStyle(
                  color: Color(0xFF357A7B),
                  fontSize: 12,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  letterSpacing: -0.08,
                ),
              ),
              Text(
                '${hospital['more_clinics'].length} More clinic',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            hospital['wait_time'],
            style: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 12,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
              height: 1.33,
              letterSpacing: -0.08,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E7EB),
      ),
    );
  }

  Widget buildDateAndTimeSection(Map<String, dynamic> appointment) {
    return Column(
      children: [
        buildDateSelection(appointment),
        const SizedBox(height: 24),
        buildTimeSlots(appointment),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDateSelection(Map<String, dynamic> appointment) {
    return SizedBox(
      height: 45,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...appointment['available_days'].map((day) {
              final hasSlots = (day['slots'] as List).isNotEmpty;
              return SizedBox(
                width: 130,
                child: buildDateChip(
                  day['day'],
                  hasSlots,
                  badge: hasSlots ? '${day['slots'].length} Slot' : null,
                  isNoSlot: !hasSlots,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildTimeSlots(Map<String, dynamic> appointment) {
    List<dynamic> slots = appointment['available_days']
        .firstWhere((day) => day['day'] == _selectedDate,
            orElse: () => {'slots': []})['slots'];

    return SizedBox(
      height: 45,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: slots.map((slot) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: buildTimeSlot(slot),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildDateChip(String label, bool showBadge,
      {String? badge, bool isNoSlot = false}) {
    final isSelected = _selectedDate == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedDate = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
                  isSelected ? const Color(0xFF357A7B) : const Color(0xFFE0F2F1),
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w700,
              ),
            ),
            if (isNoSlot)
              const Text(
                ' (No Slot)',
                style: TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 11,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                ),
              ),
            if (showBadge && badge != null) ...[
              const SizedBox(width: 6),
              Text(
                '($badge)',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 11,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildTimeSlot(String time) {
    final isSelected = _selectedTimeSlot == time;
    return GestureDetector(
      onTap: () => setState(() => _selectedTimeSlot = time),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF357A7B) : const Color(0xFFE0F2F1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          time,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF357A7B),
            fontSize: 11,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoaded) {
          final appointment = state.details['appointment'] as Map<String, dynamic>;
          return Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(appointment),
                buildHospitalInfo(appointment['hospital'] as Map<String, dynamic>),
                const SizedBox(height: 12),
                buildDivider(),
                const SizedBox(height: 12),
                buildDateAndTimeSection(appointment),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}