import 'dart:convert';

import 'package:khorsand87/constants/urls.dart';
import 'package:khorsand87/moduls/core/api/core_api.dart';
import 'package:khorsand87/moduls/login/model/profile_model.dart';

abstract class GetProfileApi {
  Future<ProfileModel> getProfile() {
    throw UnimplementedError();
  }
}

class GetProfileApiImp implements GetProfileApi {
  final _coreApi = CoreApi();

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _coreApi.get(
        Uri.parse(
          Urls.profile,
        ),
      );

      print(response);
      print(response!.body);

      if (response != null && response.statusCode == 200) {
        final Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(response.body));
        final ProfileModel profileModel = ProfileModel.fromJson(json);
        return profileModel;
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
