import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
part 'isfromdrawer_event.dart';
part 'isfromdrawer_state.dart';

class IsfromdrawerBloc extends Bloc<IsfromdrawerEvent, IsfromdrawerState> {
  IsfromdrawerBloc() : super(IsfromdrawerInitial()) {
    on<IsfromdrawerEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<IsPressedIndex>((event, emit) {
      emit(
        IsDrawerIndex(
          index: event.index,
          latLng: LatLng(event.lat, event.lng),
        ),
      );
    });
  }
}
