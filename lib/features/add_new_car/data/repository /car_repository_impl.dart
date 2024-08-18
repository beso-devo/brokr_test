import 'package:brokr/core/data/models/base_local_data_source.dart';
import 'package:brokr/features/add_new_car/domain/entity/car_entity.dart';
import 'package:brokr/features/add_new_car/domain/repository/car_repository.dart';
import 'package:brokr/features/add_new_car/domain/usecases/add_car_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/repository/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/util/constants.dart';
import '../datasource/car_remote_datasource.dart';

@LazySingleton(as: CarRepository)
class CarRepositoryImpl extends BaseRepositoryImpl implements CarRepository {
  final CarRemoteDataSource carRemoteDataSource;
  final NetworkInfo networkInfo;

  CarRepositoryImpl({
    required BaseLocalDataSource baseLocalDataSource,
    required this.carRemoteDataSource,
    required this.networkInfo,
  }) : super(
      baseRemoteDataSource: carRemoteDataSource,
      baseLocalDataSource: baseLocalDataSource,
      networkInfo: networkInfo);

  @override
  Future<Either<Failure, CarEntity>> create(CarParams params) async {
    final result = await carRemoteDataSource.create(params);
    if (result.data == null) {
      return Left(ServerFailure(ErrorCode.SERVER_ERROR));
    } else {
      return Right(result.data!);
    }
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getAll() async {
    final result = await carRemoteDataSource.getAll();
    if (result.data == null) {
      return Left(ServerFailure(ErrorCode.SERVER_ERROR));
    } else {
      return Right(result.data!);
    }
  }
}
