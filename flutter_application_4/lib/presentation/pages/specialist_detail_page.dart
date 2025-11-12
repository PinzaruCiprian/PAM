import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/pages/app_bar.dart';
import 'package:flutter_application_4/presentation/pages/doctor_profile.dart';
import 'package:flutter_application_4/presentation/widgets/stats_row.dart';
import 'package:flutter_application_4/presentation/widgets/info_tabs.dart';
import 'package:flutter_application_4/presentation/pages/appointment_card.dart';
import 'package:flutter_application_4/presentation/pages/timing_section.dart';
import 'package:flutter_application_4/presentation/pages/location_section.dart';
import 'package:flutter_application_4/presentation/widgets/status_bar.dart';
import 'package:flutter_application_4/presentation/blocs/doctor_details_bloc.dart';

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
