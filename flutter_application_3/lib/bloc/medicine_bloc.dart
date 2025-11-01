import 'package:flutter_bloc/flutter_bloc.dart';
import '../v5.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(MedicineInitial()) {
    on<LoadMedicineFeed>(_onLoadMedicineFeed);
    on<LoadDoctorDetails>(_onLoadDoctorDetails);
  }

  void _onLoadMedicineFeed(LoadMedicineFeed event, Emitter<MedicineState> emit) {
    try {
      emit(MedicineLoading());
      final feedData = medicineFeed;
      emit(MedicineFeedLoaded(feedData));
    } catch (e) {
      emit(MedicineError(e.toString()));
    }
  }

  void _onLoadDoctorDetails(LoadDoctorDetails event, Emitter<MedicineState> emit) {
    try {
      emit(MedicineLoading());
      final doctorData = doctorDetails;
      emit(DoctorDetailsLoaded(doctorData));
    } catch (e) {
      emit(MedicineError(e.toString()));
    }
  }
}