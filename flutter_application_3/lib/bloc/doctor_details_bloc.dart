import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class DoctorDetailsEvent {}

class LoadDoctorDetails extends DoctorDetailsEvent {}

// States
abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final Map<String, dynamic> details;
  DoctorDetailsLoaded(this.details);
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;
  DoctorDetailsError(this.message);
}

// Bloc
class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsState> {
  DoctorDetailsBloc() : super(DoctorDetailsInitial()) {
    on<LoadDoctorDetails>((event, emit) async {
      try {
        emit(DoctorDetailsLoading());
        // Load JSON asset and parse
        final jsonStr = await rootBundle.loadString('assets/v5.json');
        final Map<String, dynamic> data = json.decode(jsonStr) as Map<String, dynamic>;
        final details = data['doctorDetails'] as Map<String, dynamic>?;
        if (details == null) {
          throw Exception('Doctor details not found in v5.json');
        }
        emit(DoctorDetailsLoaded(details));
      } catch (e) {
        emit(DoctorDetailsError(e.toString()));
      }
    });
  }
}