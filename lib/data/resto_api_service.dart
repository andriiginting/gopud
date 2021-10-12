import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/resto_exception.dart';
import 'package:restaurant_app/helper/restaurant_constant.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class RestoNetworkService {

  Future<dynamic> get(String path) async {
    var responseJson;
    var uri = Uri.parse(RestaurantConstant.baseUrl + path);
    try {
      final response = await http.get(uri);
      responseJson = _getResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getDetailMerchant(String id) async {
    var responseJson;
    var uri = Uri.parse(RestaurantConstant.baseUrl + RestaurantConstant.detailPath + id);
    try {
      final response = await http.get(uri);
      responseJson = _getMerchantResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return RestaurantList.fromJson(responseJson);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _getMerchantResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return MerchantDetail.fromJson(responseJson);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
