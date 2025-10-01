import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  String _selectedDate = 'Today';
  String? _selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
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
          _buildHeader(),
          _buildHospitalInfo(),
          const SizedBox(height: 12),
          _buildDivider(),
          const SizedBox(height: 12),
          _buildDateAndTimeSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'In-Clinic Appointment',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w700,
              height: 1.54,
              letterSpacing: -0.08,
            ),
          ),
          Text(
            '৳1,000',
            textAlign: TextAlign.right,
            style: TextStyle(
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

  Widget _buildHospitalInfo() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evercare Hospital Ltd.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w600,
              height: 1.33,
              letterSpacing: -0.08,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Boshundhora, Dhaka',
                style: TextStyle(
                  color: Color(0xFF357A7B),
                  fontSize: 12,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  letterSpacing: -0.08,
                ),
              ),
              Text(
                '2 More clinic',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            '30 mins or less wait time',
            style: TextStyle(
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

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E7EB),
      ),
    );
  }

  Widget _buildDateAndTimeSection() {
    return Column(
      children: [
        _buildDateSelection(),
        const SizedBox(height: 24),
        _buildTimeSlots(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateSelection() {
    return SizedBox(
      height: 45,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: _buildDateChip('Today', false, isNoSlot: true),
            ),
            SizedBox(
              width: 140,
              child: _buildDateChip('Tomorrow', true, badge: '20 Slot'),
            ),
            SizedBox(
              width: 130,
              child: _buildDateChip('17 Oct', true, badge: '12 Slot'),
            ),
            SizedBox(
              width: 130,
              child: _buildDateChip('18 Oct', true, badge: '15 Slot'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    return SizedBox(
      height: 45,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTimeSlot('06:00 - 06:30'),
            const SizedBox(width: 8),
            _buildTimeSlot('06:30 - 07:00'),
            const SizedBox(width: 8),
            _buildTimeSlot('07:00 - 07:30'),
            const SizedBox(width: 8),
            _buildTimeSlot('07:30 - 08:00'),
          ],
        ),
      ),
    );
  }

  Widget _buildDateChip(String label, bool showBadge, {String? badge, bool isNoSlot = false}) {
    final isSelected = _selectedDate == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedDate = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF357A7B) : const Color(0xFFE0F2F1),
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

  Widget _buildTimeSlot(String time) {
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
}