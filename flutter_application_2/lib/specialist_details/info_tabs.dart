import 'package:flutter/material.dart';

class InfoTabs extends StatefulWidget {
  const InfoTabs({super.key});

  @override
  State<InfoTabs> createState() => _InfoTabsState();
}

class _InfoTabsState extends State<InfoTabs> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildTab('Info', 0),
          _buildVerticalDivider(),
          _buildTab('History', 1),
          _buildVerticalDivider(),
          _buildTab('Review', 2),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 20,
        width: 1,
        color: const Color(0xFFE5E7EB),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ] : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}