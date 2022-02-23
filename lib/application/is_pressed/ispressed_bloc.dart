import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

part 'ispressed_event.dart';
part 'ispressed_state.dart';

class IspressedBloc extends Bloc<IspressedEvent, IspressedState> {
  IspressedBloc() : super(IspressedInitial()) {
    on<IspressedEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<IsPressedLocation>((event, emit) async {
      emit(IFPressedLocation(latLng: event.latLng));
    });
  }
}
