import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import 'package:property_care/core/Data/Model/ResponseModel/ownerDashboardModel.dart';
import 'package:riverpod/riverpod.dart';

final ownerDashboardProvider = FutureProvider.autoDispose<OwnerDashboardModel>((ref) async {
  final service = ref.read(authServiceProvider);
  return await service.getOwnerDashboardData();
});
