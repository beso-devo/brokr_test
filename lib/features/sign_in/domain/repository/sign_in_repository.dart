import 'package:dartz/dartz.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../core/domain/entity/user_entity.dart';

abstract class SignInRepository extends BaseRepository {
  Future<Either<Failure, UserEntity>> signIn(String name, String password);
}
