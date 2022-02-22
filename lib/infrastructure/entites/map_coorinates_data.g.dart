// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_coorinates_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapCoordinatesCollection _$$_MapCoordinatesCollectionFromJson(
        Map<String, dynamic> json) =>
    _$_MapCoordinatesCollection(
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MapCoordinatesCollectionToJson(
        _$_MapCoordinatesCollection instance) =>
    <String, dynamic>{
      'locations': instance.locations,
    };
