import 'package:dio/dio.dart';
import 'package:property_care/core/Data/Model/BodyModel/resetPassBodyModel.dart';
import 'package:property_care/core/Data/Model/BodyModel/verifyOtpBodyModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/availableFlatModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/consolidatedStateModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/documentDetialsModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/editProfileResModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getDocumentListModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getProfileModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getServiceRequestDetailsModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getServiceRequestModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getTenantDetailsModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getTenantListModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/gtUtilityStatusModel.dart' show GetUtilityStatusModel;
import 'package:property_care/core/Data/Model/ResponseModel/logoutModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/ownerDashboardModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/propertyDetailsModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/propertyListModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/registerResModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/resetPassResModel.dart';
import 'package:property_care/core/Data/Model/ResponseModel/verifyOtpResModel.dart';
import 'package:retrofit/retrofit.dart';
import '../Data/Model/BodyModel/forgotPassBodyModel.dart';
import '../Data/Model/BodyModel/loginBodyModel.dart';
import '../Data/Model/BodyModel/registerBodyModel.dart';
import '../Data/Model/ResponseModel/forgotPassResModel.dart';
import '../Data/Model/ResponseModel/getPropertyScoreModel.dart';
import '../Data/Model/ResponseModel/getTenantPaymentModel.dart';
import '../Data/Model/ResponseModel/loginResModel.dart';

part 'ApiStateNetwork.g.dart';

@RestApi(baseUrl: "https://realestate.gwsstaging.com")
abstract class ApiStateNetwork {
  factory ApiStateNetwork(Dio dio, {String baseUrl}) = _ApiStateNetwork;

  @GET("/api/v1/auth/available-flats")
  Future<AvailableFlatsModel> availableFlats();

  @POST("/api/v1/auth/register")
  Future<RegisterResModel> register(@Body() RegisterBodyModel body);

  @POST("/api/v1/auth/login")
  Future<LoginResModel> login(@Body() LoginBodyModel body);

  @POST("/api/v1/auth/forgot-password")
  Future<ForgotPassResModel> forgotPass(@Body() ForgotPassBodyModel body);

  @POST("/api/v1/auth/verify-otp")
  Future<VerifyOtpResModel> verifyOtp(@Body() VerifyOtpBodyModel body);

  @POST("/api/v1/auth/reset-password")
  Future<ResetPassResModel> resetPassword(@Body() ResetPassBodyModel body);

  @GET("/api/v1/auth/me")
  Future<GetProfileModel> getProfileData();

  @GET("/api/v1/owner/dashboard")
  Future<OwnerDashboardModel> getOwnerDashboardData();

  @GET("/api/v1/owner/property/details")
  Future<PropertyDetailsModel> propertyDetails();

  @POST("/api/v1/auth/logout")
  Future<LogoutModel> logout();

  @GET("/api/v1/owner/properties")
  Future<PropertyListModel> getProperyList();

  @GET("/api/v1/property-scores")
  Future<GetPropertyScoreModel> getPropertyScore();

  @GET("/api/v1/owner/property/consolidated-status")
  Future<ConsolidatedStatusModel> propertyConsolidateStatus();

  @MultiPart()
  @POST("/api/v1/auth/profile")
  Future<EditProfileResModel> editProfile(
    @Part(name: "name") String name,
    @Part(name: "phone") String phone,
    @Part(name: "image") MultipartFile? image,
  );

  @MultiPart()
  @POST("/api/v1/tickets")
  Future<void> createService(
    @Part(name: "service_category") String serviceCategory,
    @Part(name: "service_type") String? serviceType,
    @Part(name: "title") String title,
    @Part(name: "details") String details,
    @Part(name: "preferred_date") String? preferredDate,
    @Part(name: "preferred_time") String? preferredTime,
    @Part(name: "priority") String priority,
    @Part(name: "attachment") MultipartFile? attachment,
    @Part(name: "type") String type,
  );

  @GET("/api/v1/tickets")
  Future<GetServiceRequestModel> getServiceRequest(
    @Query("status_filter") String statusFilter,
    @Query("search") String search,
    @Query("type") String type,
  );

  @GET("/api/v1/tickets/{id}")
  Future<GetServiceRequestDetailsModel> getServiceRequestDetails(
    @Path("id") String id,
  );

  @GET("/api/v1/documents")
  Future<GetDocumentListModel> getDocumentList(
    @Query("category") String category,
  );

  @GET("/api/v1/documents/{id}/download")
  Future<DocumentDetailsModel> documentDetails(@Path('id') String id);

  @MultiPart()
  @POST("/api/v1/owner/tenants")
  Future<dynamic> addTenant(
    @Part(name: "property_id") int propertyId,
    @Part(name: "name") String name,
    @Part(name: "phone") String phone,
    @Part(name: "email") String email,
    @Part(name: "monthly_rent") String monthlyRent,
    @Part(name: "security_deposit") String securityDeposit,
    @Part(name: "move_in_date") String moveInDate,
    @Part(name: "move_out_date") String moveOutDate,
    @Part(name: "tenant_status") String tenantStatus,
    @Part(name: "tenant_type") String tenantType,
    @Part(name: "image") MultipartFile? image,
  );

  @GET("/api/v1/owner/tenants")
  Future<GetTenantListModel> getTenantList();

  @GET("/api/v1/owner/tenants/{id}")
  Future<GetTenantDetailsModel> getTenantDetails(@Path('id') String id);

  @MultiPart()
  @POST("/api/v1/owner/tenants/{id}")
  Future<dynamic> editTenant(
    @Path('id') String id,
    @Part(name: "property_id") int propertyId,
    @Part(name: "name") String name,
    @Part(name: "phone") String phone,
    @Part(name: "email") String email,
    @Part(name: "monthly_rent") String monthlyRent,
    @Part(name: "security_deposit") String securityDeposit,
    @Part(name: "move_in_date") String moveInDate,
    @Part(name: "move_out_date") String moveOutDate,
    @Part(name: "tenant_status") String tenantStatus,
    @Part(name: "tenant_type") String tenantType,
    @Part(name: "image") MultipartFile? image,
  );

  @GET("/api/v1/owner/tenants/{id}/payments")
  Future<GetTenantPaymentModel> getTenantPayment(@Path('id') String id);

  @GET("/api/v1/owner/tenants/{id}/utility-status")
  Future<GetUtilityStatusModel> getUtilityStatus(@Path("id") String id);
}
