import 'package:dio/dio.dart';
import 'package:property_care/core/Data/Model/BodyModel/loginBodyModel.dart';
import 'package:property_care/core/Data/Model/BodyModel/registerBodyModel.dart';
import 'package:property_care/core/Data/Model/BodyModel/resetPassBodyModel.dart';
import 'package:property_care/core/Data/Model/BodyModel/verifyOtpBodyModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/availableFlatModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/consolidatedStateModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/forgotPassResModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getProfileModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getServiceRequestDetailsModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getServiceRequestModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/logoutModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/ownerDashboardModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/propertyDetailsModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/propertyListModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/resetPassResModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/verifyOtpResModel.dart';
import 'package:property_care/core/Network/ApiStateNetwork.dart';
import '../Data/Model/BodyModel/forgotPassBodyModel.dart';
import '../Data/Model/ResponseModel/editProfileResModel.dart';
import '../Data/Model/ResponseModel/getPropertyScoreModel.dart';
import '../Data/Model/ResponseModel/loginResModel.dart';
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

  Future<LoginResModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final body = LoginBodyModel(login: email, password: password);
      final response = await api.login(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ForgotPassResModel> forgotPassword({required String email}) async {
    try {
      final body = ForgotPassBodyModel(email: email);
      final response = await api.forgotPass(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifyOtpResModel> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final body = VerifyOtpBodyModel(email: email, otp: otp);
      final response = await api.verifyOtp(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResetPassResModel> resetPassword({
    required String newPassword,
    required String confirmPassword,
    required String email,
  }) async {
    try {
      final body = ResetPassBodyModel(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        email: email,
      );
      final response = await api.resetPassword(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetProfileModel> getProfileData() async {
    try {
      final response = await api.getProfileData();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<OwnerDashboardModel> getOwnerDashboardData() async {
    try {
      final response = await api.getOwnerDashboardData();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<PropertyDetailsModel> propertyDetails() async {
    try {
      final response = await api.propertyDetails();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<LogoutModel> logout() async {
    try {
      final response = await api.logout();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<PropertyListModel> getPropertyList() async {
    try {
      final response = await api.getProperyList();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetPropertyScoreModel> getPropertyScore() async {
    try {
      final response = await api.getPropertyScore();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<EditProfileResModel> editProfile({
    required String name,
    required String phone,
    required MultipartFile? image,
  }) async {
    try {
      final response = await api.editProfile(name, phone, image);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ConsolidatedStatusModel> propertyConsolidateStatus() async {
    try {
      final response = await api.propertyConsolidateStatus();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createService({
    required String serviceCategory,
    required String? serviceType,
    required String title,
    required String details,
    required String? preferredDate,
    required String? preferredTime,
    required String priority,
    MultipartFile? attachment,
    required String type,
  }) async {
    try {
      await api.createService(
        serviceCategory,
        serviceType,
        title,
        details,
        preferredDate,
        preferredTime,
        priority,
        attachment,
        type,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GetServiceRequestModel> getServiceRequest({
    required String statusFilter,
    required String search,
    required String type,
  }) async {
    try {
      final response = await api.getServiceRequest(statusFilter, search, type);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetServiceRequestDetailsModel> getServiceRequestDetails({
    required String id,
  }) async {
    try {
      final response = await api.getServiceRequestDetails(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
