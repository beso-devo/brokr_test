import 'package:dartz/dartz.dart';
import '../../../../../core/data/repository/base_repository.dart';
import '../../../../../core/error/failures.dart';
import '../../../../core/domain/entity/user_entity.dart';
import '../usecases/continue_as_guest_usecase.dart';
import '../usecases/sign_up_usecase.dart';

abstract class SignUpRepository extends BaseRepository {
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params);
  Future<Either<Failure, UserEntity>> continueAsGuest(ContinueAsGuestParams params);
}
