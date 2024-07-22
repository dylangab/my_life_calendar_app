import 'package:hive/hive.dart';
part 'milestone_model.g.dart';

@HiveType(typeId: 0)
class Milestone {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;

  Milestone({required this.description, required this.title});
}
