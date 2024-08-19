import 'package:brokr/features/main_page/data/models/boat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'main_api_service.g.dart';

@RestApi(baseUrl: "https://api.example.com/")
abstract class MainApiService {
  factory MainApiService(Dio dio) = _MainApiService;

  @GET("/boats")
  Future<List<BoatModel>> getCars();

  @POST("/boats/create")
  Future<BoatModel> create(
    @Body() Map<String, dynamic> boatData,
    @Part(name: "image") MultipartFile image,
  );

  @PUT("/boats")
  Future<BoatModel> update(
    @Body() Map<String, dynamic> boatData,
    @Part(name: "image") MultipartFile image,
  );

  @DELETE("/boats/{id}")
  Future<BoatModel> delete(@Path("id") int id);
}
