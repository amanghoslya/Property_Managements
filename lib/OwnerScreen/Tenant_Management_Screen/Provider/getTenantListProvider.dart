import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getTenantListModel.dart';

final getTenantListProvider = FutureProvider.autoDispose<GetTenantListModel>((
  ref,
) async {
  final service = ref.read(authServiceProvider);
  return await service.getTenantList();
});
