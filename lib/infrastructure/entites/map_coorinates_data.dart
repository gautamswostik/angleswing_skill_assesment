import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_coorinates_data.freezed.dart';
part 'map_coorinates_data.g.dart';

@freezed
class MapCoordinatesCollection with _$MapCoordinatesCollection {
  const factory MapCoordinatesCollection({
    @Default([]) List<List<double>> locations,
  }) = _MapCoordinatesCollection;

  factory MapCoordinatesCollection.fromJson(Map<String, dynamic> json) =>
      _$MapCoordinatesCollectionFromJson(json);
}
