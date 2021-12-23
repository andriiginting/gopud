import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class DetailRestaurantFoodMenuV2 extends StatelessWidget {
  final RestaurantMenu menus;

  const DetailRestaurantFoodMenuV2({Key? key, required this.menus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _menuHeader(context),
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: _getMenuItem(context, menus.foods[index].name),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: menus.foods.length)
      ],
    );
  }

  Widget _getMenuItem(BuildContext context, String menu) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 0),
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
            Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 20.0,
            ),
            Container(
                margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text('Add',
                        style: TextStyle(color: Colors.green, fontSize: 12)),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.yellow,
                    side: BorderSide(color: Colors.green),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                  onPressed: () {
                    print('Pressed');
                  },
                ))
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
                imageUrl: "https://source.unsplash.com/300x300/?foods",
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
        Text(
          "Foods",
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
