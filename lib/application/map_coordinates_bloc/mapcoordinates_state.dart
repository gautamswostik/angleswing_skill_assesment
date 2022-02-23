part of 'mapcoordinates_bloc.dart';

abstract class MapcoordinatesState extends Equatable {
  const MapcoordinatesState();

  @override
  List<Object> get props => [];
}

class MapcoordinatesInitial extends MapcoordinatesState {}

class MapcoordinatesLoading extends MapcoordinatesState {}

class MappCoordinatesLoaded extends MapcoordinatesState {
  final List<List<double>> mapCoordinates;
  final int index;
  const MappCoordinatesLoaded(
      {required this.mapCoordinates, required this.index});

  @override
  List<Object> get props => [mapCoordinates];
}

class CoordinatesError extends MapcoordinatesState {
  final Failure failure;

  const CoordinatesError(this.failure);

  @override
  List<Object> get props => [failure];
}
