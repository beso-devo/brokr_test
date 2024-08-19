import 'dart:io';

import 'package:brokr/features/main_page/domain/entities/boat_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repository/dealer_main_repository.dart';

@LazySingleton()
class GetBoatsUseCase extends UseCase<List<BoatEntity>, BoatParams> {
  final MainPageRepository mainPageRepository;

  GetBoatsUseCase(this.mainPageRepository);

  @override
  Future<Either<Failure, List<BoatEntity>>> call(BoatParams params) async {
    return await mainPageRepository.getBoats();
  }
}

class BoatParams {
  File? image;
  String title = '';
  String price = '';
  String currency = '';

  BoatParams(this.image, this.title, this.price, this.currency);

  Map<String, dynamic> toMap() => {
        'title': title,
        'price': price,
        'currency': currency,
        // 'image': image != null ? CustomMultiPartFile.prepareFileForUpload(image!) : null
      };

}
