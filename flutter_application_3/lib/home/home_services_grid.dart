import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/medicine_bloc.dart';
import '../bloc/medicine_state.dart';

class HomeServicesGrid extends StatelessWidget {
  const HomeServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state is MedicineFeedLoaded) {
          final actions = (state.medicineFeed['actions'] as List<dynamic>).cast<Map<String, dynamic>>();
          
          return Column(
            children: [
              // First row: two elements (50/50)
              Row(
                children: [
                  Expanded(
                    child: _LargeBox(
                      imageUrl: actions[0]['image'] as String,
                      label: actions[0]['title'] as String,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _LargeBox(
                      imageUrl: actions[1]['image'] as String,
                      label: actions[1]['title'] as String,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Second row: three elements (33/33/33)
              Row(
                children: [
                  Expanded(
                    child: _SmallBox(
                      imageUrl: actions[2]['image'] as String,
                      label: actions[2]['title'] as String,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SmallBox(
                      imageUrl: actions[3]['image'] as String,
                      label: actions[3]['title'] as String,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SmallBox(
                      imageUrl: actions[4]['image'] as String,
                      label: actions[4]['title'] as String,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _LargeBox extends StatelessWidget {
  final String imageUrl;
  final String label;

  const _LargeBox({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 127,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF1F1F1), width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 31,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallBox extends StatelessWidget {
  final String imageUrl;
  final String label;

  const _SmallBox({required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF1F1F1), width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: 31,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}