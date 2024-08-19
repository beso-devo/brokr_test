import 'package:brokr/core/di/injection_container.dart';
import 'package:brokr/core/network/models/base_response_model.dart';
import 'package:brokr/core/util/services/get_multi_part_file.dart';
import 'package:brokr/features/main_page/data/services/main_api_service.dart';
import 'package:brokr/features/main_page/domain/entities/boat_entity.dart';
import 'package:brokr/features/main_page/domain/usecases/get_boats_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/models/base_remote_datasource.dart';
import '../../../../core/network/models/base_list_response_model.dart';

abstract class MainPageRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseListResponseModel<BoatEntity>> getBoats(String token, String url);

  Future<BaseResponseModel<BoatEntity>> createBoat(
      String token, String url, BoatParams params);

  Future<BaseResponseModel<BoatEntity>> updateBoat(
      String token, String url, BoatParams params);

  Future<int?> deleteBoat(String token, String url, int id);
}

@LazySingleton(as: MainPageRemoteDataSource)
class MainPageRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MainPageRemoteDataSource {
  MainApiService mainApiService = MainApiService(getIt<Dio>());

  MainPageRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseListResponseModel<BoatEntity>> getBoats(
      String token, String url) async {
    final boatModels = await mainApiService.getCars();
    List<BoatEntity> cars = boatModels
        .map((boatModel) => BoatEntity(
              id: boatModel.id,
              image: boatModel.image,
              title: boatModel.title,
              price: boatModel.price,
              currency: boatModel.currency,
            ))
        .toList();

    /// Why `BaseListResponseModel` because maybe we need to implement generic class for all of our models in one place and return multiple
    /// values for the repository layer...
    return BaseListResponseModel(data: cars);
  }

  @override
  Future<BaseResponseModel<BoatEntity>> createBoat(
      String token, String url, BoatParams params) async {
    final boatModel = await mainApiService.create(params.toMap(),
        await CustomMultiPartFile.prepareFileForUpload(params.image!));
    BoatEntity car = BoatEntity(
      id: boatModel.id,
      image: boatModel.image,
      title: boatModel.title,
      price: boatModel.price,
      currency: boatModel.currency,
    );
    return BaseResponseModel(data: car);
  }

  @override
  Future<BaseResponseModel<BoatEntity>> updateBoat(
      String token, String url, BoatParams params) async {
    final boatModel = await mainApiService.update(params.toMap(),
        await CustomMultiPartFile.prepareFileForUpload(params.image!));
    BoatEntity car = BoatEntity(
      id: boatModel.id,
      image: boatModel.image,
      title: boatModel.title,
      price: boatModel.price,
      currency: boatModel.currency,
    );
    return BaseResponseModel(data: car);
  }

  @override
  Future<int?> deleteBoat(String token, String url, int id) async {
    await mainApiService.delete(id);
    return /*status code*/ 200;
  }
}
