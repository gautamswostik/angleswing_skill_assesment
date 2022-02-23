part of 'isfromdrawer_bloc.dart';

abstract class IsfromdrawerEvent extends Equatable {
  const IsfromdrawerEvent();

  @override
  List<Object> get props => [];
}

class IsPressedIndex extends IsfromdrawerEvent {
  final int index;
  final double lat;
  final double lng;
  const IsPressedIndex({
    required this.index,
    required this.lat,
    required this.lng,
  });
  @override
  List<Object> get props => [index];
}
