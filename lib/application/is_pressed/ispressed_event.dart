part of 'ispressed_bloc.dart';

abstract class IspressedEvent extends Equatable {
  const IspressedEvent();

  @override
  List<Object> get props => [];
}



class IsPressedLocation extends IspressedEvent {
  final LatLng latLng;

  const IsPressedLocation({required this.latLng});

  @override
  List<Object> get props => [latLng];
}
