import 'package:brokr/features/add_new_car/domain/entity/car_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/car_repository.dart';

@LazySingleton()
class AddCarUseCase extends UseCase<CarEntity, CarParams> {
  final CarRepository addCarRepository;

  AddCarUseCase(this.addCarRepository);

  @override
  Future<Either<Failure, CarEntity>> call(CarParams params) async {
    return await addCarRepository.create(params);
  }
}

class CarParams {
  String title = '';
  String brand = '';

  CarParams(this.title, this.brand);

  Map<String, dynamic> toMap() => {'title': title, 'brand': brand};
}
