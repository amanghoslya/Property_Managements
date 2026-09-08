import 'package:property_care/core/Data/Model/BodyModel/registerBodyModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/availableFlatModel.dart';
import 'package:property_care/core/Network/ApiStateNetwork.dart';

import '../Data/Model/ResponseModel/registerResModel.dart';

class AuthService {
  final ApiStateNetwork api;

  AuthService(this.api);

  Future<RegisterResModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
    required String propertyNameNumber,
    required String confirmPassword,
  }) async {
    try {
      final body = RegisterBodyModel(
        email: email,
        password: password,
        phone: phone,
        name: name,
        role: role,
        propertyNameNumber: propertyNameNumber,
        confirmPassword: confirmPassword,
      );
      final response = await api.register(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AvailableFlatsModel> getAvailableFlats() async {
    try {
      final response = await api.availableFlats();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
