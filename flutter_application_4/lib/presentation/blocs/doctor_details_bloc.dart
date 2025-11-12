import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/injection_container.dart';
import 'package:flutter_application_4/domain/usecases/get_details.dart';
import 'package:flutter_application_4/domain/entities/details_entity.dart';

// Events
abstract class DoctorDetailsEvent {}

class LoadDoctorDetails extends DoctorDetailsEvent {}

// States
abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final DetailsEntity details;
  DoctorDetailsLoaded(this.details);
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;
  DoctorDetailsError(this.message);
}

// Bloc
class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsState> {
  final GetDetails _getDetails;

  DoctorDetailsBloc({GetDetails? getDetails})
      : _getDetails = getDetails ?? InjectionContainer().getDetails,
        super(DoctorDetailsInitial()) {
    on<LoadDoctorDetails>((event, emit) async {
      try {
        emit(DoctorDetailsLoading());
        final details = await _getDetails.call();
        emit(DoctorDetailsLoaded(details));
      } catch (e) {
        emit(DoctorDetailsError(e.toString()));
      }
    });
  }
}
