import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserProfile {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? lifeExpectancy;

  @HiveField(2)
  DateTime birthdate;

  UserProfile(
      {required this.lifeExpectancy, this.name, required this.birthdate});
}
