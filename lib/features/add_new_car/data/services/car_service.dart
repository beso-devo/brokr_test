import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/car_model.dart';

part 'car_service.g.dart';

@RestApi(baseUrl: "https://api.example.com/")
abstract class CarService {
  factory CarService(Dio dio) = _CarService;

  @GET("/cars")
  Future<List<CarModel>> getCars();

  @POST("/cars/create")
  Future<CarModel> create(@Body() Map<String, dynamic> carData);
}