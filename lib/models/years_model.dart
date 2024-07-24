import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_life_calendar_app/models/week_model.dart';
part 'years_model.freezed.dart';

@freezed
class YearsModel with _$YearsModel {
  const factory YearsModel(
      {required List<WeeksModel> weeks, required int yearNumber}) = _YearsModel;
}
