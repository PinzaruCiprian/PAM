import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'specialist_details/app_bar.dart';
import 'specialist_details/doctor_profile.dart';
import 'specialist_details/stats_row.dart';
import 'specialist_details/info_tabs.dart';
import 'specialist_details/appointment_card.dart';
import 'specialist_details/timing_section.dart';
import 'specialist_details/location_section.dart';
import 'shared/status_bar.dart';
import 'bloc/doctor_details_bloc.dart';

class SpecialistDetailPage extends StatelessWidget {
  const SpecialistDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorDetailsBloc()..add(LoadDoctorDetails()),
      child: const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            IphoneXBarsStatusDefault(),
            SpecialistAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DoctorProfile(),
                      SizedBox(height: 20),
                      StatsRow(),
                      SizedBox(height: 20),
                      InfoTabs(),
                      SizedBox(height: 20),
                      AppointmentCard(),
                      SizedBox(height: 20),
                      TimingSection(),
                      SizedBox(height: 20),
                      LocationSection(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
