part of 'ispressed_bloc.dart';

abstract class IspressedState extends Equatable {
  const IspressedState();
  
  @override
  List<Object> get props => [];
}

class IspressedInitial extends IspressedState {}


class IFPressedLocation extends IspressedState {
  final LatLng latLng;

  const IFPressedLocation({required this.latLng});

  @override
  List<Object> get props => [latLng];
}