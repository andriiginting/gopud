import 'dart:async';

import 'package:restaurant_app/data/resto_api_service.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class MerchantDetailRepository {
  RestoNetworkService _service = RestoNetworkService();

  Future<RestaurantModelV2> getMerchantDetail(String merchantId) async {
    MerchantDetail response = await _service.getDetailMerchant(merchantId);
    return response.restaurant;
  }
}
