import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class DetailRestaurantFoodMenuV2 extends StatelessWidget {
  final RestaurantMenu menus;

  const DetailRestaurantFoodMenuV2({Key? key, required this.menus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: _getMenuItem(context, menus.foods[index].name),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: menus.foods.length);
  }

  Widget _getMenuItem(BuildContext context, String menu) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: _imageWithRating(context),
          title: Text(
            menu,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {},
        )
      ],
    );
  }

  Widget _imageWithRating(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "https://source.unsplash.com/300x300/?foods",
              width: 100,
              height: 500,
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
