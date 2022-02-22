import 'package:angleswing_skill_assesment/app_setup/dio/dio_client.dart';
import 'package:angleswing_skill_assesment/application/core/entities/failure.dart';
import 'package:angleswing_skill_assesment/application/core/service/api_endpoints.dart';
import 'package:angleswing_skill_assesment/infrastructure/entites/map_coorinates_data.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ICoordinates {
  Future<Either<MapCoordinatesCollection, Failure>> getMapCoordinates();
}

class Coordinates implements ICoordinates {
  Dio get _dio => DioClient().dioClient();

  @override
  Future<Either<MapCoordinatesCollection, Failure>> getMapCoordinates() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        LocationUrl.mapdatas,
      );

      final json = Map<String, dynamic>.from(response.data!);
      final data = MapCoordinatesCollection.fromJson(json);
      return Left(data);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
