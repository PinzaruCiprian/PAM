import 'package:flutter_bloc/flutter_bloc.dart';
import '../v5.dart';

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
        // Simulăm un delay scurt pentru a demonstra starea de loading
        await Future.delayed(const Duration(milliseconds: 500));
        if (doctorDetails == null) {
          throw Exception('Doctor details not found');
        }
        emit(DoctorDetailsLoaded(doctorDetails));
      } catch (e) {
        emit(DoctorDetailsError(e.toString()));
      }
    });
  }
}