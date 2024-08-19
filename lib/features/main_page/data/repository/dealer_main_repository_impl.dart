import 'package:brokr/features/main_page/domain/entities/boat_entity.dart';
import 'package:brokr/features/main_page/domain/usecases/get_boats_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/constants.dart';
import '../../domain/repository/dealer_main_repository.dart';
import '../datasource/main_page_local_datasource.dart';
import '../datasource/main_page_remote_datasource.dart';

@LazySingleton(as: MainPageRepository)
class MainPageRepositoryImpl extends BaseRepositoryImpl
    implements MainPageRepository {
  final MainPageRemoteDataSource mainPageRemoteDataSource;
  final MainPageLocalDataSource mainPageLocalDataSource;
  final NetworkInfo networkInfo;

  MainPageRepositoryImpl({
    required this.mainPageRemoteDataSource,
    required this.mainPageLocalDataSource,
    required this.networkInfo,
  }) : super(
            baseRemoteDataSource: mainPageRemoteDataSource,
            baseLocalDataSource: mainPageLocalDataSource,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, List<BoatEntity>>> getBoats() async {
    return requestWithToken((token, url) async {
      final result =
          await mainPageRemoteDataSource.getBoats("Bearer $token", url);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }

  @override
  Future<Either<Failure, BoatEntity>> createBoat(BoatParams params) async {
    return requestWithToken((token, url) async {
      final result = await mainPageRemoteDataSource.createBoat(
          "Bearer $token", url, params);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }

  @override
  Future<Either<Failure, BoatEntity>> updateBoat(BoatParams params) async {
    return requestWithToken((token, url) async {
      final result = await mainPageRemoteDataSource.updateBoat(
          "Bearer $token", url, params);
      if (result.data == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result.data!);
      }
    });
  }

  @override
  Future<Either<Failure, int>> deleteBoat(int id) async {
    return requestWithToken((token, url) async {
      final result =
          await mainPageRemoteDataSource.deleteBoat("Bearer $token", url, id);
      if (result == null) {
        return Left(ServerFailure(ErrorCode.SERVER_ERROR));
      } else {
        return Right(result);
      }
    });
  }
}
