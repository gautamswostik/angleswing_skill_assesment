import 'package:angleswing_skill_assesment/application/core/entities/failure.dart';
import 'package:angleswing_skill_assesment/infrastructure/map_coordinates_repo.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'mapcoordinates_event.dart';
part 'mapcoordinates_state.dart';

class MapcoordinatesBloc
    extends Bloc<MapcoordinatesEvent, MapcoordinatesState> {
  Coordinates get _cordinatesRepo => Coordinates();
  MapcoordinatesBloc() : super(MapcoordinatesInitial()) {
    on<MapcoordinatesEvent>((event, emit) {});
    on<GetMapCoodinates>((event, emit) async {
      emit(MapcoordinatesLoading());

      final coordinatesCollection = await _cordinatesRepo.getMapCoordinates();
      emit(
        coordinatesCollection.fold(
          (l) => MappCoordinatesLoaded(
              mapCoordinates: l.locations, index: l.locations.length),
          (r) => CoordinatesError(r),
        ),
      );
    });
    on<AddMapCoordinate>((event, emit) async {
      final coordinatesCollection = await _cordinatesRepo.getMapCoordinates();
      emit(
        coordinatesCollection.fold(
          (l) {
            List<List<double>> list = [...l.locations, event.coordinates];
            return MappCoordinatesLoaded(
              mapCoordinates: list,
              index: l.locations.length,
            );
          },
          (r) => CoordinatesError(r),
        ),
      );
    });
  }
}
