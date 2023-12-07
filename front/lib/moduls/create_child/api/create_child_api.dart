import 'dart:convert';

import 'package:khorsand87/constants/urls.dart';
import 'package:khorsand87/moduls/core/api/core_api.dart';
import 'package:khorsand87/moduls/create_child/model/create_child_model.dart';

abstract class CreateChildApi {
  Future<CreateChildResponseModel> createChild({
    required String childFirstName,
    required String childLastName,
    required String initialWallet,
    required String weekly,
  }) {
    throw UnimplementedError();
  }
}

class CreateChildApiImp implements CreateChildApi {
  final _coreApi = CoreApi();
  @override
  Future<CreateChildResponseModel> createChild({
    required String childFirstName,
    required String childLastName,
    required String initialWallet,
    required String weekly,
  }) async {
    try {
      final response = await _coreApi.post(
          Uri.parse(
            Urls.createChild,
          ),
          body: {
            'firstName': childFirstName,
            'lastName': childLastName,
            'initialWallet': int.tryParse(initialWallet),
            'weekly': int.tryParse(initialWallet),
          });

      if (response != null && response.statusCode == 201) {
        final Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(response.body));
        final CreateChildResponseModel createChildResponse = CreateChildResponseModel.fromJson(json);
        return createChildResponse;
      } else {
        // Handle error scenarios, e.g., throw an exception or return a default model
        throw Exception('Failed to fetch profile');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('Failed to fetch profile: $e');
    }
  }
}
