import 'package:angleswing_skill_assesment/application/core/entities/failure.dart';
import 'package:angleswing_skill_assesment/infrastructure/entites/map_coorinates_data.dart';
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
          (l) => MappCoordinatesLoaded(mapCoordinates: l),
          (r) => CoordinatesError(r),
        ),
      );
    });
  }
}
