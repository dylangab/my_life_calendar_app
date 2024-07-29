// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayModel {
  DateTime get date => throw _privateConstructorUsedError;
  bool get isLived => throw _privateConstructorUsedError;
  Milestone get milestone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayModelCopyWith<DayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayModelCopyWith<$Res> {
  factory $DayModelCopyWith(DayModel value, $Res Function(DayModel) then) =
      _$DayModelCopyWithImpl<$Res, DayModel>;
  @useResult
  $Res call({DateTime date, bool isLived, Milestone milestone});
}

/// @nodoc
class _$DayModelCopyWithImpl<$Res, $Val extends DayModel>
    implements $DayModelCopyWith<$Res> {
  _$DayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isLived = null,
    Object? milestone = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLived: null == isLived
          ? _value.isLived
          : isLived // ignore: cast_nullable_to_non_nullable
              as bool,
      milestone: null == milestone
          ? _value.milestone
          : milestone // ignore: cast_nullable_to_non_nullable
              as Milestone,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayModelImplCopyWith<$Res>
    implements $DayModelCopyWith<$Res> {
  factory _$$DayModelImplCopyWith(
          _$DayModelImpl value, $Res Function(_$DayModelImpl) then) =
      __$$DayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, bool isLived, Milestone milestone});
}

/// @nodoc
class __$$DayModelImplCopyWithImpl<$Res>
    extends _$DayModelCopyWithImpl<$Res, _$DayModelImpl>
    implements _$$DayModelImplCopyWith<$Res> {
  __$$DayModelImplCopyWithImpl(
      _$DayModelImpl _value, $Res Function(_$DayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isLived = null,
    Object? milestone = null,
  }) {
    return _then(_$DayModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isLived: null == isLived
          ? _value.isLived
          : isLived // ignore: cast_nullable_to_non_nullable
              as bool,
      milestone: null == milestone
          ? _value.milestone
          : milestone // ignore: cast_nullable_to_non_nullable
              as Milestone,
    ));
  }
}

/// @nodoc

class _$DayModelImpl implements _DayModel {
  const _$DayModelImpl(
      {required this.date, required this.isLived, required this.milestone});

  @override
  final DateTime date;
  @override
  final bool isLived;
  @override
  final Milestone milestone;

  @override
  String toString() {
    return 'DayModel(date: $date, isLived: $isLived, milestone: $milestone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isLived, isLived) || other.isLived == isLived) &&
            (identical(other.milestone, milestone) ||
                other.milestone == milestone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, isLived, milestone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      __$$DayModelImplCopyWithImpl<_$DayModelImpl>(this, _$identity);
}

abstract class _DayModel implements DayModel {
  const factory _DayModel(
      {required final DateTime date,
      required final bool isLived,
      required final Milestone milestone}) = _$DayModelImpl;

  @override
  DateTime get date;
  @override
  bool get isLived;
  @override
  Milestone get milestone;
  @override
  @JsonKey(ignore: true)
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
