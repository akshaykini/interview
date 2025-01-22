import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:interview/MODEL/dataModel.dart';

class Apicall {
  DataModel model = DataModel();
  api() async {
    final Dio _dio = Dio();
    Response<dynamic> response = await _dio.get(
      "https://newsapi.org/v2/everything?q=tesla&from=2024-12-22&sortBy=publishedAt&apiKey=6246ba7cceb14218904b86475b204c72",
    );

    var datadecode = jsonDecode(response.toString());

    model = DataModel.fromJson(datadecode);

    return model;
  }
}
