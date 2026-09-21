import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getServiceRequestModel.dart';

final getServiceRequestProvider = FutureProvider.family
    .autoDispose<
      GetServiceRequestModel,
      ({String statusFilter, String search,String type})
    >((ref, args) async {
      final apiService = ref.watch(authServiceProvider);
      final response = await apiService.getServiceRequest(
        statusFilter: args.statusFilter,
        search: args.search,
        type: args.type,
      );
      return response;
    });
