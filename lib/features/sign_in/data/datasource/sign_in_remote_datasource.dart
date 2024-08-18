import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/data/models/base_remote_datasource.dart';
import '../../../../../core/network/models/base_response_model.dart';
import '../../../../core/domain/entity/user_entity.dart';

abstract class SignInRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<UserEntity>> login(String email, String password);
}

@LazySingleton(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignInRemoteDataSource {
  SignInRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseResponseModel<UserEntity>> login(
      String email, String password) async {
    try {
      /// Here we can do the request from the backend and for sure we should make the
      /// conditions and implement the code to handle the errors and display it using
      /// `FlushBarMixin` widget or something like it...

      // final result = await dio.post(Endpoints.BASE_URL + Endpoints.SIGN_IN,
      //     data: jsonEncode({"username": email.trim(), "password": password}));

      // return BaseResponseModel(
      //     data: UserEntity.fromJson(json.decode(result.data)['result']));

      return BaseResponseModel(
          data: UserEntity(id: 1, isVerified: true, balance: 5000));
    } catch (e) {
      if (e is DioException) {
        return BaseResponseModel(
            data: null, message: json.decode(e.response?.data)['result']);
      } else {
        return BaseResponseModel(data: null, message: "");
      }
    }
  }
}
