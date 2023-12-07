import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:khorsand87/constants/urls.dart';
import 'package:khorsand87/moduls/core/api/core_api.dart';
import 'package:khorsand87/moduls/core/components/app_text_field.dart';
import 'package:khorsand87/moduls/create_child/model/get_child_list_model.dart';

abstract class GetChildListApi {
  Future<List<GetChildListModel>> getChildList();
}

class GetChildListApiImp implements GetChildListApi {
  final CoreApi _coreApi = CoreApi();

  @override
  Future<List<GetChildListModel>> getChildList() async {
    try {
      final response = await _coreApi.get(
        Uri.parse(Urls.getChildList),
      );
      print(response!.body);

      if (response != null && response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        // Convert the List<dynamic> to List<GetChildListModel>
        final List<GetChildListModel> childList = jsonList.map((json) => GetChildListModel.fromJson(json)).toList();

        return childList;
      } else {
        // Handle error scenarios, e.g., throw an exception or return an empty list
        throw Exception('Failed to fetch child list: ${response?.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('Failed to fetch child list: $e');
    }
  }
}
