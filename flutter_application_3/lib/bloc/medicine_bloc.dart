import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(MedicineInitial()) {
    on<LoadMedicineFeed>(_onLoadMedicineFeed);
    on<LoadDoctorDetails>(_onLoadDoctorDetails);
  }

  Future<void> _onLoadMedicineFeed(LoadMedicineFeed event, Emitter<MedicineState> emit) async {
    try {
      emit(MedicineLoading());
      final jsonStr = await rootBundle.loadString('assets/v5.json');
      final Map<String, dynamic> data = json.decode(jsonStr) as Map<String, dynamic>;
      final feedData = data['medicineFeed'] as Map<String, dynamic>?;
      if (feedData == null) throw Exception('medicineFeed missing in v5.json');
      emit(MedicineFeedLoaded(feedData));
    } catch (e) {
      emit(MedicineError(e.toString()));
    }
  }

  Future<void> _onLoadDoctorDetails(LoadDoctorDetails event, Emitter<MedicineState> emit) async {
    try {
      emit(MedicineLoading());
      final jsonStr = await rootBundle.loadString('assets/v5.json');
      final Map<String, dynamic> data = json.decode(jsonStr) as Map<String, dynamic>;
      final doctorData = data['doctorDetails'] as Map<String, dynamic>?;
      if (doctorData == null) throw Exception('doctorDetails missing in v5.json');
      emit(DoctorDetailsLoaded(doctorData));
    } catch (e) {
      emit(MedicineError(e.toString()));
    }
  }
}