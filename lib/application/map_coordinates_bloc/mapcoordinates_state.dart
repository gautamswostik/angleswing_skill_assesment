part of 'mapcoordinates_bloc.dart';

abstract class MapcoordinatesState extends Equatable {
  const MapcoordinatesState();

  @override
  List<Object> get props => [];
}

class MapcoordinatesInitial extends MapcoordinatesState {}

class MapcoordinatesLoading extends MapcoordinatesState {}

class MappCoordinatesLoaded extends MapcoordinatesState {
  final MapCoordinatesCollection mapCoordinates;

  const MappCoordinatesLoaded({required this.mapCoordinates});

  @override
  List<Object> get props => [mapCoordinates];
}

class CoordinatesError extends MapcoordinatesState {
  final Failure failure;

  const CoordinatesError(this.failure);

  @override
  List<Object> get props => [failure];
}


