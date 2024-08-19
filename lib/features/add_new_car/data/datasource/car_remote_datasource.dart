import 'package:brokr/core/network/models/base_list_response_model.dart';
import 'package:brokr/features/add_new_car/domain/entity/car_entity.dart';
import 'package:brokr/features/add_new_car/domain/usecases/add_car_usecase.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../core/data/models/base_remote_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/di/injection_container.dart';
import '../services/car_service.dart';

abstract class CarRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<CarEntity>> create(CarParams params);

  Future<BaseListResponseModel<CarEntity>> getAll();
}

@LazySingleton(as: CarRemoteDataSource)
class CarRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements CarRemoteDataSource {
  CarService carService = CarService(getIt<Dio>());

  CarRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseResponseModel<CarEntity>> create(CarParams params) async {
    final carModel = await carService.create(params.toMap());
    CarEntity car =
        CarEntity(id: carModel.id, name: carModel.name, brand: carModel.brand);
    return BaseResponseModel(data: car);
  }

  @override
  Future<BaseListResponseModel<CarEntity>> getAll() async {
    final carModels = await carService.getCars();
    List<CarEntity> cars = carModels
        .map((carModel) => CarEntity(
            id: carModel.id, name: carModel.name, brand: carModel.brand))
        .toList();

    /// Why `BaseListResponseModel` because maybe we need to implement generic class for all of our models in one place and return multiple
    /// values for the repository layer...
    return BaseListResponseModel(data: cars);
  }
}
