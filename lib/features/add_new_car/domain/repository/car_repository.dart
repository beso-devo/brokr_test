import 'package:brokr/features/add_new_car/domain/usecases/add_car_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../entity/car_entity.dart';

abstract class CarRepository extends BaseRepository {
  Future<Either<Failure, CarEntity>> create(CarParams params);
  Future<Either<Failure, List<CarEntity>>> getAll();
}
