import 'user_entity.dart';
import 'action_entity.dart';
import 'speciality_entity.dart';
import 'specialist_entity.dart';

class FeedEntity {
  final UserEntity user;
  final List<ActionEntity> actions;
  final List<SpecialityEntity> specialities;
  final List<SpecialistEntity> specialists;

  FeedEntity({required this.user, required this.actions, required this.specialities, required this.specialists});
}
