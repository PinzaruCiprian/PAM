import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_state.dart';

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state is MedicineFeedLoaded) {
          final userData = state.medicineFeed.user;
          // Debug: print profile image URL so we can verify it's coming from web
          // ignore: avoid_print
          print('TopMenu: profile_image URL -> ${userData.profileImage}');
          return Container(
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x33C2C2C2),
                  blurRadius: 20,
                  offset: Offset(0, 6),
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Tooltip(
                  message: userData.profileImage,
                  child: ClipOval(
                    child: Image.network(
                      userData.profileImage,
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/profile.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w600,
                          height: 1.29,
                        ),
                      ),
                      Text(
                        userData.location,
                        style: const TextStyle(
                          color: Color(0xFFB2BAC6),
                          fontSize: 11,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w400,
                          height: 1.64,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 36,
                  height: 36,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 24,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
