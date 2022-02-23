part of 'mapcoordinates_bloc.dart';

abstract class MapcoordinatesEvent extends Equatable {
  const MapcoordinatesEvent();

  @override
  List<Object> get props => [];
}

class GetMapCoodinates extends MapcoordinatesEvent {}

class AddMapCoordinate extends MapcoordinatesEvent {
  final List<double> coordinates;

  const AddMapCoordinate({required this.coordinates});

  @override
  List<Object> get props => [coordinates];
}
