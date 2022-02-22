// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_coorinates_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapCoordinatesCollection _$MapCoordinatesCollectionFromJson(
    Map<String, dynamic> json) {
  return _MapCoordinatesCollection.fromJson(json);
}

/// @nodoc
class _$MapCoordinatesCollectionTearOff {
  const _$MapCoordinatesCollectionTearOff();

  _MapCoordinatesCollection call({List<List<double>> locations = const []}) {
    return _MapCoordinatesCollection(
      locations: locations,
    );
  }

  MapCoordinatesCollection fromJson(Map<String, Object?> json) {
    return MapCoordinatesCollection.fromJson(json);
  }
}

/// @nodoc
const $MapCoordinatesCollection = _$MapCoordinatesCollectionTearOff();

/// @nodoc
mixin _$MapCoordinatesCollection {
  List<List<double>> get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapCoordinatesCollectionCopyWith<MapCoordinatesCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapCoordinatesCollectionCopyWith<$Res> {
  factory $MapCoordinatesCollectionCopyWith(MapCoordinatesCollection value,
          $Res Function(MapCoordinatesCollection) then) =
      _$MapCoordinatesCollectionCopyWithImpl<$Res>;
  $Res call({List<List<double>> locations});
}

/// @nodoc
class _$MapCoordinatesCollectionCopyWithImpl<$Res>
    implements $MapCoordinatesCollectionCopyWith<$Res> {
  _$MapCoordinatesCollectionCopyWithImpl(this._value, this._then);

  final MapCoordinatesCollection _value;
  // ignore: unused_field
  final $Res Function(MapCoordinatesCollection) _then;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
abstract class _$MapCoordinatesCollectionCopyWith<$Res>
    implements $MapCoordinatesCollectionCopyWith<$Res> {
  factory _$MapCoordinatesCollectionCopyWith(_MapCoordinatesCollection value,
          $Res Function(_MapCoordinatesCollection) then) =
      __$MapCoordinatesCollectionCopyWithImpl<$Res>;
  @override
  $Res call({List<List<double>> locations});
}

/// @nodoc
class __$MapCoordinatesCollectionCopyWithImpl<$Res>
    extends _$MapCoordinatesCollectionCopyWithImpl<$Res>
    implements _$MapCoordinatesCollectionCopyWith<$Res> {
  __$MapCoordinatesCollectionCopyWithImpl(_MapCoordinatesCollection _value,
      $Res Function(_MapCoordinatesCollection) _then)
      : super(_value, (v) => _then(v as _MapCoordinatesCollection));

  @override
  _MapCoordinatesCollection get _value =>
      super._value as _MapCoordinatesCollection;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_MapCoordinatesCollection(
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapCoordinatesCollection implements _MapCoordinatesCollection {
  const _$_MapCoordinatesCollection({this.locations = const []});

  factory _$_MapCoordinatesCollection.fromJson(Map<String, dynamic> json) =>
      _$$_MapCoordinatesCollectionFromJson(json);

  @JsonKey()
  @override
  final List<List<double>> locations;

  @override
  String toString() {
    return 'MapCoordinatesCollection(locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapCoordinatesCollection &&
            const DeepCollectionEquality().equals(other.locations, locations));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locations));

  @JsonKey(ignore: true)
  @override
  _$MapCoordinatesCollectionCopyWith<_MapCoordinatesCollection> get copyWith =>
      __$MapCoordinatesCollectionCopyWithImpl<_MapCoordinatesCollection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapCoordinatesCollectionToJson(this);
  }
}

abstract class _MapCoordinatesCollection implements MapCoordinatesCollection {
  const factory _MapCoordinatesCollection({List<List<double>> locations}) =
      _$_MapCoordinatesCollection;

  factory _MapCoordinatesCollection.fromJson(Map<String, dynamic> json) =
      _$_MapCoordinatesCollection.fromJson;

  @override
  List<List<double>> get locations;
  @override
  @JsonKey(ignore: true)
  _$MapCoordinatesCollectionCopyWith<_MapCoordinatesCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
