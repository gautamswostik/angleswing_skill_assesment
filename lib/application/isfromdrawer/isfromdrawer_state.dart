part of 'isfromdrawer_bloc.dart';

abstract class IsfromdrawerState extends Equatable {
  const IsfromdrawerState();

  @override
  List<Object> get props => [];
}

class IsfromdrawerInitial extends IsfromdrawerState {}

class IsDrawerIndex extends IsfromdrawerState {
  final int index;
  final LatLng latLng;
  const IsDrawerIndex({required this.index, required this.latLng});
  @override
  List<Object> get props => [index];
}
