import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_event.dart';
import 'package:flutter_application_4/presentation/blocs/medicine_state.dart';
import 'package:flutter_application_4/injection_container.dart';
import 'package:flutter_application_4/domain/usecases/get_feed.dart';
import 'package:flutter_application_4/domain/usecases/get_details.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final GetFeed _getFeed;
  final GetDetails _getDetails;

  MedicineBloc({GetFeed? getFeed, GetDetails? getDetails})
      : _getFeed = getFeed ?? InjectionContainer().getFeed,
        _getDetails = getDetails ?? InjectionContainer().getDetails,
        super(MedicineInitial()) {
    on<LoadMedicineFeed>(_onLoadMedicineFeed);
    on<LoadDoctorDetails>(_onLoadDoctorDetails);
  }

  Future<void> _onLoadMedicineFeed(LoadMedicineFeed event, Emitter<MedicineState> emit) async {
    try {
      final cached = _getFeed.getCached();
      if (cached != null) {
        emit(MedicineFeedLoaded(cached));
      } else {
        emit(MedicineLoading());
      }

      final feed = await _getFeed.call();
      if (cached == null || feed != cached) {
        emit(MedicineFeedLoaded(feed));
      }
    } catch (e) {
      final cached = _getFeed.getCached();
      if (cached == null) {
        emit(MedicineLoading());
        Future.delayed(const Duration(seconds: 3), () {
          add(LoadMedicineFeed());
        });
      }
    }
  }

  Future<void> _onLoadDoctorDetails(LoadDoctorDetails event, Emitter<MedicineState> emit) async {
    try {
      final cached = _getDetails.getCached();
      if (cached != null) {
        emit(DoctorDetailsLoaded(cached));
      } else {
        emit(MedicineLoading());
      }

      final details = await _getDetails.call();
      if (cached == null || details != cached) {
        emit(DoctorDetailsLoaded(details));
      }
    } catch (e) {
      final cached = _getDetails.getCached();
      if (cached == null) {
        emit(MedicineLoading());
        Future.delayed(const Duration(seconds: 3), () {
          add(LoadDoctorDetails(event.doctorId));
        });
      }
    }
  }
}
