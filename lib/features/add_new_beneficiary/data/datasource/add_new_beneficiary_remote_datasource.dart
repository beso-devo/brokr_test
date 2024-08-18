import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/models/base_remote_datasource.dart';
import '../../../../core/domain/entity/beneficiary_entity.dart';
import '../../../../core/network/models/base_response_model.dart';
import '../../domain/usecases/add_new_beneficiary_usecase.dart';

abstract class AddNewBeneficiaryRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<BeneficiaryEntity>> addBeneficiary(
      SubmitNewBeneficiaryParams params, String? token, String url);
}

@LazySingleton(as: AddNewBeneficiaryRemoteDataSource)
class AddNewBeneficiaryRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements AddNewBeneficiaryRemoteDataSource {
  AddNewBeneficiaryRemoteDataSourceImpl({required Dio dio}) : super(dio: dio);

  @override
  Future<BaseResponseModel<BeneficiaryEntity>> addBeneficiary(
      SubmitNewBeneficiaryParams params, String? token, String url) async {
    // final result = await dio.get(url + Endpoints.GET_BENEFICIARIES,
    //     options: GetOptions.getOptionsWithToken(token));

    return BaseResponseModel(
        data: BeneficiaryEntity(
            phoneNumber: "+971" + params.phoneNumber,
            nickName: params.nickname,
            id: 1));
  }
}
