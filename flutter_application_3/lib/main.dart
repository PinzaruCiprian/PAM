import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/status_bar.dart';
import 'home/top_menu.dart';
import 'home/search.dart';
import 'home/home_services_grid.dart';
import 'home/home_specialities.dart';
import 'home/home_specialists.dart';
import 'bloc/medicine_bloc.dart';
import 'bloc/medicine_event.dart';
import 'bloc/medicine_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => MedicineBloc()..add(LoadMedicineFeed()),
      child: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: BlocBuilder<MedicineBloc, MedicineState>(
          builder: (context, state) {
            if (state is MedicineLoading) {
              return const SizedBox.shrink();
            }
            if (state is MedicineFeedLoaded) {
              return ListView(
                children: const [
                  IphoneXBarsStatusDefault(),
                  TopMenu(),

                  // Container cu padding pentru Widget1, Widget2, Widget3
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      children: [
                        Search(),
                        SizedBox(height: 12),
                        HomeServicesGrid(),
                        SizedBox(height: 12),
                        HomeSpecialities(),
                        SizedBox(height: 12),
                        HomeSpecialists(),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is MedicineError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
