import '../../domain/entities/doctor_entity.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/entities/timing_entity.dart';
import '../../domain/entities/location_entity.dart';

class DetailsModel {
  final DoctorEntity doctor;
  final AppointmentEntity appointment;
  final List<TimingEntity> timing;
  final List<LocationEntity> locations;
  final List<String> tabs;

  DetailsModel({required this.doctor, required this.appointment, required this.timing, required this.locations, required this.tabs});

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    final doc = json['doctor'] as Map<String, dynamic>;
    final doctor = DoctorEntity(
      id: doc['id'] as int,
      name: doc['name'] as String,
      speciality: doc['speciality'] as String,
      qualification: doc['qualification'] as String,
      profileImage: doc['profile_image'] as String,
      rating: (doc['rating'] as num).toDouble(),
      reviewsCount: doc['reviews_count'] as int,
      yearsOfExperience: doc['years_of_experience'] as int,
      patientsTreated: doc['patients_treated'] as int,
      isFavorite: doc['is_favorite'] as bool,
    );

    final apJson = json['appointment'] as Map<String, dynamic>;
    final hospJson = apJson['hospital'] as Map<String, dynamic>;
    final hospital = HospitalEntity(
      name: hospJson['name'] as String,
      location: hospJson['location'] as String,
      waitTime: hospJson['wait_time'] as String,
      moreClinics: (hospJson['more_clinics'] as List<dynamic>?)?.map((e) => { 'name': e['name'] as String, 'location': e['location'] as String }).toList() ?? [],
    );

    final availableDays = (apJson['available_days'] as List<dynamic>?)?.map((e) => AvailableDayEntity(day: e['day'] as String, slots: (e['slots'] as List<dynamic>).cast<String>())).toList() ?? [];

    final appointment = AppointmentEntity(
      type: apJson['type'] as String,
      fee: apJson['fee'] as int,
      currency: apJson['currency'] as String,
      hospital: hospital,
      availableDays: availableDays,
    );

    final timing = (json['timing'] as List<dynamic>?)?.map((e) => TimingEntity(day: e['day'] as String, time: e['time'] as String)).toList() ?? [];

    final locations = (json['locations'] as List<dynamic>?)?.map((e) => LocationEntity(area: e['area'] as String, hospital: e['hospital'] as String, fullAddress: e['full_address'] as String)).toList() ?? [];

    final tabs = (json['tabs'] as List<dynamic>?)?.cast<String>() ?? [];

    return DetailsModel(doctor: doctor, appointment: appointment, timing: timing, locations: locations, tabs: tabs);
  }
}
