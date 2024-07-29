import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_life_calendar_app/models/milestone_model.dart';

part 'day_model.freezed.dart';

@freezed
class DayModel with _$DayModel {
  const factory DayModel(
      {required DateTime date,
      required bool isLived,
      required Milestone milestone}) = _DayModel;
}
