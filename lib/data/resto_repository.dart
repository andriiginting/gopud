import 'dart:async';

import 'package:restaurant_app/data/resto_api_service.dart';
import 'package:restaurant_app/helper/restaurant_constant.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class RestoRepository {
  RestoNetworkService _service = RestoNetworkService();

  Future<List<RestaurantModel>> getListRestaurant() async {
    RestaurantList response = await _service.get(RestaurantConstant.listPath);
    return response.restaurantList;
  }
}
