import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

import 'detail_restaurant_add_counter.dart';
import 'detail_restaurant_favorite.dart';

class DetailRestaurantDrinksMenu extends StatelessWidget {
  final RestaurantMenu menus;

  const DetailRestaurantDrinksMenu({Key? key, required this.menus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _menuHeader(context),
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: _getMenuItem(context, menus.drinks[index].name),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const DottedLine(
                  lineThickness: 0.2,
                  dashColor: Colors.grey,

                ),
            itemCount: menus.drinks.length)
      ],
    );
  }

  Widget _getMenuItem(BuildContext context, String menu) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menu,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "20.000",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  _imageWithRating(context)
                ])),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DetailRestaurantFavorite(),
            DetailRestaurantButtonCounter()
          ],
        ))
      ],
    );
  }

  Widget _imageWithRating(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
                imageUrl: "https://source.unsplash.com/300x300/?drinks",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error)))
      ],
    );
  }

  Widget _menuHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          "Drinks",
          maxLines: 1,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        DottedLine(
          lineThickness: 0.2,
          dashColor: Colors.grey,
        ),
        SizedBox(height: 16)
      ],
    );
  }
}
