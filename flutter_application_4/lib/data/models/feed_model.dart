import '../../domain/entities/user_entity.dart';
import '../../domain/entities/action_entity.dart';
import '../../domain/entities/speciality_entity.dart';
import '../../domain/entities/specialist_entity.dart';

class FeedModel {
  final UserEntity user;
  final List<ActionEntity> actions;
  final List<SpecialityEntity> specialities;
  final List<SpecialistEntity> specialists;

  FeedModel({required this.user, required this.actions, required this.specialities, required this.specialists});

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;
    final user = UserEntity(
      name: userJson['name'] as String,
      location: userJson['location'] as String,
      profileImage: userJson['profile_image'] as String,
    );

    final actions = (json['actions'] as List<dynamic>?)?.map((e) => ActionEntity(title: e['title'] as String, image: e['image'] as String)).toList() ?? [];

    final specialities = (json['specialities'] as List<dynamic>?)?.map((e) => SpecialityEntity(id: e['id'] as int, name: e['name'] as String, icon: e['icon'] as String)).toList() ?? [];

    final specialists = (json['specialists'] as List<dynamic>?)?.map((e) => SpecialistEntity(
          id: e['id'] as int,
          name: e['name'] as String,
          speciality: e['speciality'] as String,
          rating: (e['rating'] as num).toDouble(),
          available: e['available'] as bool,
          image: e['image'] as String,
        )).toList() ?? [];

    return FeedModel(user: user, actions: actions, specialities: specialities, specialists: specialists);
  }
}
