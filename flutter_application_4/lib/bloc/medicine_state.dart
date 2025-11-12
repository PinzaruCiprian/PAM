import 'package:equatable/equatable.dart';
import '../domain/entities/feed_entity.dart';
import '../domain/entities/details_entity.dart';

abstract class MedicineState extends Equatable {
  const MedicineState();

  @override
  List<Object?> get props => [];
}

class MedicineInitial extends MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineFeedLoaded extends MedicineState {
  final FeedEntity medicineFeed;

  const MedicineFeedLoaded(this.medicineFeed);

  @override
  List<Object?> get props => [medicineFeed];
}

class DoctorDetailsLoaded extends MedicineState {
  final DetailsEntity doctorDetails;

  const DoctorDetailsLoaded(this.doctorDetails);

  @override
  List<Object?> get props => [doctorDetails];
}

class MedicineError extends MedicineState {
  final String message;

  const MedicineError(this.message);

  @override
  List<Object> get props => [message];
}