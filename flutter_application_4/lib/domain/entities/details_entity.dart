import 'doctor_entity.dart';
import 'appointment_entity.dart';
import 'timing_entity.dart';
import 'location_entity.dart';

class DetailsEntity {
  final DoctorEntity doctor;
  final AppointmentEntity appointment;
  final List<TimingEntity> timing;
  final List<LocationEntity> locations;
  final List<String> tabs;

  DetailsEntity({required this.doctor, required this.appointment, required this.timing, required this.locations, required this.tabs});
}
