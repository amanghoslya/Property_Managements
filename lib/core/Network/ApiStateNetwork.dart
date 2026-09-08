import 'package:dio/dio.dart';
import 'package:property_care/core/Data/Model/ResponseModel/availableFlatModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/registerResModel.dart';
import 'package:retrofit/retrofit.dart';

import '../Data/Model/BodyModel/registerBodyModel.dart';

part 'ApiStateNetwork.g.dart';

@RestApi(baseUrl: "https://realestate.gwsstaging.com")
abstract class ApiStateNetwork {
  factory ApiStateNetwork(Dio dio, {String baseUrl}) = _ApiStateNetwork;

  @GET("/api/v1/auth/available-flats")
  Future<AvailableFlatsModel> availableFlats();

  @POST("/api/v1/auth/register")
  Future<RegisterResModel> register(@Body() RegisterBodyModel body);
}
