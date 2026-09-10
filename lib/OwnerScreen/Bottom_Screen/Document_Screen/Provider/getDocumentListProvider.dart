import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:property_care/core/AuthService/AuthServiceProvider.dart';
import 'package:property_care/core/Data/Model/ResponseModel/getDocumentListModel.dart';

final getDocumentListProvider =
    FutureProvider.family.autoDispose<GetDocumentListModel, String>((ref, category) async {
      final service = ref.read(authServiceProvider);
      return await service.getDocumentList(category: category);
    });
