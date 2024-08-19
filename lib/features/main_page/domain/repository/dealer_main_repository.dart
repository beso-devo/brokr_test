import 'package:brokr/features/main_page/domain/entities/boat_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../usecases/get_boats_usecase.dart';

abstract class MainPageRepository extends BaseRepository {
  Future<Either<Failure, List<BoatEntity>>> getBoats();
  Future<Either<Failure, BoatEntity>> createBoat(BoatParams params);
  Future<Either<Failure, BoatEntity>> updateBoat(BoatParams params);
  Future<Either<Failure, int>> deleteBoat(int id);
}
