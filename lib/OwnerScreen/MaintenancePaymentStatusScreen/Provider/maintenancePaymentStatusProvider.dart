import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import 'package:property_care/core/Data/Model/ResponseModel/maintenancePaymentStatusModel.dart';
import 'package:riverpod/riverpod.dart';

final maintenancePaymentStatusProvider = FutureProvider.autoDispose<MaintenancePaymentStatusModel>((
  ref,
) async {
  final service = ref.read(authServiceProvider);
  return await service.maintenancePaymentStatus();
});
