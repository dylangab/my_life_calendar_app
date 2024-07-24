import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_life_calendar_app/models/day_model.dart';
part 'week_model.freezed.dart';

@freezed
class WeeksModel with _$WeeksModel {
  const factory WeeksModel(
      {required List<DayModel> days,
      required int weekNumber,
      required bool isLived}) = _WeeksModel;
}
