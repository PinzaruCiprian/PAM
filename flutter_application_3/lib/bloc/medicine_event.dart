import 'package:equatable/equatable.dart';

abstract class MedicineEvent extends Equatable {
  const MedicineEvent();

  @override
  List<Object> get props => [];
}

class LoadMedicineFeed extends MedicineEvent {}

class LoadDoctorDetails extends MedicineEvent {
  final int doctorId;

  const LoadDoctorDetails(this.doctorId);

  @override
  List<Object> get props => [doctorId];
}