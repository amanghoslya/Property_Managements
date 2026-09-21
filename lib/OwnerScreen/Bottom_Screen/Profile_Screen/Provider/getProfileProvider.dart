import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getProfileModel.dart';

final getProfileProvider = FutureProvider.autoDispose<GetProfileModel>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.getProfileData();
});
