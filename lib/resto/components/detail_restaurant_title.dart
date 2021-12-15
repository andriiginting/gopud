import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class RestaurantDetailTitle extends StatelessWidget {
  final RestaurantModelV2 restaurantData;

  const RestaurantDetailTitle({Key? key, required this.restaurantData}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantData.name,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  restaurantData.description,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 10),
                )
              ],
            )),
      ],
    );
  }

}