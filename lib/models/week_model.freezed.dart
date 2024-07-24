// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeeksModel {
  List<DayModel> get days => throw _privateConstructorUsedError;
  int get weekNumber => throw _privateConstructorUsedError;
  bool get isLived => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeeksModelCopyWith<WeeksModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeksModelCopyWith<$Res> {
  factory $WeeksModelCopyWith(
          WeeksModel value, $Res Function(WeeksModel) then) =
      _$WeeksModelCopyWithImpl<$Res, WeeksModel>;
  @useResult
  $Res call({List<DayModel> days, int weekNumber, bool isLived});
}

/// @nodoc
class _$WeeksModelCopyWithImpl<$Res, $Val extends WeeksModel>
    implements $WeeksModelCopyWith<$Res> {
  _$WeeksModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? weekNumber = null,
    Object? isLived = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayModel>,
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isLived: null == isLived
          ? _value.isLived
          : isLived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeksModelImplCopyWith<$Res>
    implements $WeeksModelCopyWith<$Res> {
  factory _$$WeeksModelImplCopyWith(
          _$WeeksModelImpl value, $Res Function(_$WeeksModelImpl) then) =
      __$$WeeksModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DayModel> days, int weekNumber, bool isLived});
}

/// @nodoc
class __$$WeeksModelImplCopyWithImpl<$Res>
    extends _$WeeksModelCopyWithImpl<$Res, _$WeeksModelImpl>
    implements _$$WeeksModelImplCopyWith<$Res> {
  __$$WeeksModelImplCopyWithImpl(
      _$WeeksModelImpl _value, $Res Function(_$WeeksModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? weekNumber = null,
    Object? isLived = null,
  }) {
    return _then(_$WeeksModelImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayModel>,
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isLived: null == isLived
          ? _value.isLived
          : isLived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WeeksModelImpl implements _WeeksModel {
  const _$WeeksModelImpl(
      {required final List<DayModel> days,
      required this.weekNumber,
      required this.isLived})
      : _days = days;

  final List<DayModel> _days;
  @override
  List<DayModel> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final int weekNumber;
  @override
  final bool isLived;

  @override
  String toString() {
    return 'WeeksModel(days: $days, weekNumber: $weekNumber, isLived: $isLived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeksModelImpl &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.isLived, isLived) || other.isLived == isLived));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_days), weekNumber, isLived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeksModelImplCopyWith<_$WeeksModelImpl> get copyWith =>
      __$$WeeksModelImplCopyWithImpl<_$WeeksModelImpl>(this, _$identity);
}

abstract class _WeeksModel implements WeeksModel {
  const factory _WeeksModel(
      {required final List<DayModel> days,
      required final int weekNumber,
      required final bool isLived}) = _$WeeksModelImpl;

  @override
  List<DayModel> get days;
  @override
  int get weekNumber;
  @override
  bool get isLived;
  @override
  @JsonKey(ignore: true)
  _$$WeeksModelImplCopyWith<_$WeeksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
