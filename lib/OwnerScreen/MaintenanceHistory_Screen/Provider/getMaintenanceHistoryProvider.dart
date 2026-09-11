import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import '../../../core/Data/Model/ResponseModel/getMaintenanceHistoryModel.dart';

final getMaintenanceHistoryProvider = FutureProvider.family
    .autoDispose<GetMaintenanceHistoryModel, String>((ref, filter) async {
      final service = ref.read(authServiceProvider);
      return await service.maintenanceHistory(filter: filter);
    });
