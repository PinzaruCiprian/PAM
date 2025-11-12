import 'package:flutter_bloc/flutter_bloc.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';
import '../injection_container.dart';
import '../domain/usecases/get_feed.dart';
import '../domain/usecases/get_details.dart';

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
      // First, immediately emit cached data if available so UI is responsive.
      final cached = _getFeed.getCached();
      if (cached != null) {
        emit(MedicineFeedLoaded(cached));
      } else {
        emit(MedicineLoading());
      }

      // Then attempt network refresh. If successful and different, emit updated.
      final feed = await _getFeed.call();
      // if we had no cached data or data changed, emit the fresh feed
      if (cached == null || feed != cached) {
        emit(MedicineFeedLoaded(feed));
      }
    } catch (e) {
      // If we had cached data, don't emit an error - keep showing cached data.
      final cached = _getFeed.getCached();
      if (cached == null) {
        // Rather than throwing an error to the UI, keep the UI in loading
        // state and schedule a background retry so the app doesn't crash or
        // show an error page immediately. This avoids the unhandled
        // TimeoutException the user reported.
        emit(MedicineLoading());
        // schedule a retry in a few seconds
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