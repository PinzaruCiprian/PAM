class HospitalEntity {
  final String name;
  final String location;
  final String waitTime;
  final List<Map<String, String>> moreClinics;

  HospitalEntity({required this.name, required this.location, required this.waitTime, required this.moreClinics});
}

class AvailableDayEntity {
  final String day;
  final List<String> slots;

  AvailableDayEntity({required this.day, required this.slots});
}

class AppointmentEntity {
  final String type;
  final int fee;
  final String currency;
  final HospitalEntity hospital;
  final List<AvailableDayEntity> availableDays;

  AppointmentEntity({required this.type, required this.fee, required this.currency, required this.hospital, required this.availableDays});
}
