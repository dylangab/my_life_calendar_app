// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'years_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YearsModel {
  List<WeeksModel> get weeks => throw _privateConstructorUsedError;
  int get yearNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YearsModelCopyWith<YearsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearsModelCopyWith<$Res> {
  factory $YearsModelCopyWith(
          YearsModel value, $Res Function(YearsModel) then) =
      _$YearsModelCopyWithImpl<$Res, YearsModel>;
  @useResult
  $Res call({List<WeeksModel> weeks, int yearNumber});
}

/// @nodoc
class _$YearsModelCopyWithImpl<$Res, $Val extends YearsModel>
    implements $YearsModelCopyWith<$Res> {
  _$YearsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeks = null,
    Object? yearNumber = null,
  }) {
    return _then(_value.copyWith(
      weeks: null == weeks
          ? _value.weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<WeeksModel>,
      yearNumber: null == yearNumber
          ? _value.yearNumber
          : yearNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YearsModelImplCopyWith<$Res>
    implements $YearsModelCopyWith<$Res> {
  factory _$$YearsModelImplCopyWith(
          _$YearsModelImpl value, $Res Function(_$YearsModelImpl) then) =
      __$$YearsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeeksModel> weeks, int yearNumber});
}

/// @nodoc
class __$$YearsModelImplCopyWithImpl<$Res>
    extends _$YearsModelCopyWithImpl<$Res, _$YearsModelImpl>
    implements _$$YearsModelImplCopyWith<$Res> {
  __$$YearsModelImplCopyWithImpl(
      _$YearsModelImpl _value, $Res Function(_$YearsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeks = null,
    Object? yearNumber = null,
  }) {
    return _then(_$YearsModelImpl(
      weeks: null == weeks
          ? _value._weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<WeeksModel>,
      yearNumber: null == yearNumber
          ? _value.yearNumber
          : yearNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$YearsModelImpl implements _YearsModel {
  const _$YearsModelImpl(
      {required final List<WeeksModel> weeks, required this.yearNumber})
      : _weeks = weeks;

  final List<WeeksModel> _weeks;
  @override
  List<WeeksModel> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  final int yearNumber;

  @override
  String toString() {
    return 'YearsModel(weeks: $weeks, yearNumber: $yearNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearsModelImpl &&
            const DeepCollectionEquality().equals(other._weeks, _weeks) &&
            (identical(other.yearNumber, yearNumber) ||
                other.yearNumber == yearNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_weeks), yearNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YearsModelImplCopyWith<_$YearsModelImpl> get copyWith =>
      __$$YearsModelImplCopyWithImpl<_$YearsModelImpl>(this, _$identity);
}

abstract class _YearsModel implements YearsModel {
  const factory _YearsModel(
      {required final List<WeeksModel> weeks,
      required final int yearNumber}) = _$YearsModelImpl;

  @override
  List<WeeksModel> get weeks;
  @override
  int get yearNumber;
  @override
  @JsonKey(ignore: true)
  _$$YearsModelImplCopyWith<_$YearsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
