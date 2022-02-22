part of 'mapcoordinates_bloc.dart';

abstract class MapcoordinatesEvent extends Equatable {
  const MapcoordinatesEvent();

  @override
  List<Object> get props => [];
}

class GetMapCoodinates extends MapcoordinatesEvent {}
