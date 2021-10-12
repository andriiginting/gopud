import 'dart:convert';

class RestaurantList {
  final List<RestaurantModel> restaurantList;

  RestaurantList({required this.restaurantList});

  factory RestaurantList.fromJson(Map<String, dynamic> json) {
    var listOfRestaurant = json['restaurants'] as List;
    List<RestaurantModel> list = listOfRestaurant
        .map((restaurant) => RestaurantModel.parseJSON(restaurant))
        .toList();
    return RestaurantList(restaurantList: list);
  }
}

class MerchantDetail {
  final RestaurantModelV2 restaurant;

  MerchantDetail({
    required this.restaurant,
  });

  factory MerchantDetail.fromJson(Map<String, dynamic> json) {
    var merchant = json['restaurant'];
    var data = RestaurantModelV2.parseJSON(merchant);
    print(data);
    return MerchantDetail(
        restaurant: data
    );
  }
}

class RestaurantModelV2 {
  late String id;
  late String name;
  late String description;
  late String imageUrl;
  late String city;
  late num rating;
  late RestaurantMenu menu;

  RestaurantModelV2({required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.city,
    required this.rating,
    required this.menu
  });

  factory RestaurantModelV2.parseJSON(Map<String, dynamic> restaurant) {
    var menus = restaurant['menus'] != null ? RestaurantMenu.parseJSON(restaurant['menus']) : null;
    return RestaurantModelV2(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['description'],
        imageUrl: restaurant['pictureId'],
        city: restaurant['city'],
        rating: restaurant['rating'],
        menu: menus!
    );
  }
}

class RestaurantModel {
  late String id;
  late String name;
  late String description;
  late String imageUrl;
  late String city;
  late num rating;

  RestaurantModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.city,
      required this.rating});

  factory RestaurantModel.parseJSON(Map<String, dynamic> restaurant) {
    return RestaurantModel(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['description'],
        imageUrl: restaurant['pictureId'],
        city: restaurant['city'],
        rating: restaurant['rating']);
  }
}

List<RestaurantModel> mapData(String? json) {
  if (json == null) {
    print(json);
    return [];
  }

  final response = jsonDecode(json);
  RestaurantList restaurants = new RestaurantList.fromJson(response);
  return restaurants.restaurantList;
}

class RestaurantMenu {
  late List<FoodsMenu> foods;
  late List<DrinksMenu> drinks;

  RestaurantMenu({
    required this.drinks,
    required this.foods,
  });

  factory RestaurantMenu.parseJSON(Map<String, dynamic> menu) {
    var drinks = menu['drinks'] as List;
    var foods = menu['foods'] as List;

    List<FoodsMenu> listFoods =
    foods.map((food) => FoodsMenu.parseJSON(food)).toList();

    List<DrinksMenu> listDrinks =
    drinks.map((drink) => DrinksMenu.parseJSON(drink)).toList();

    return RestaurantMenu(drinks: listDrinks, foods: listFoods);
  }
}

class DrinksMenu {
  late String name;

  DrinksMenu({required this.name});

  factory DrinksMenu.parseJSON(Map<String, dynamic> menu) {
    return DrinksMenu(name: menu['name']);
  }
}

class FoodsMenu {
  late String name;

  FoodsMenu({required this.name});

  factory FoodsMenu.parseJSON(Map<String, dynamic> menu) {
    return FoodsMenu(name: menu['name']);
  }
}
