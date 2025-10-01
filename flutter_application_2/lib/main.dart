import 'package:flutter/material.dart';
import 'shared/status_bar.dart';
import 'home/top_menu.dart';
import 'home/search.dart';
import 'home/home_services_grid.dart';
import 'home/home_specialities.dart';
import 'home/home_specialists.dart';

void main() {
  runApp(const HomePage());
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
        body: ListView(
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
        ),
      ),
    );
  }
}
