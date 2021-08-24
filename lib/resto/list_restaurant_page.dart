import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/resto/detail_restaurant.dart';

class ListRestaurantPage extends StatelessWidget {
  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Gofood Resto",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black54,
          )),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Snapshot ${snapshot.error}");
          } else if (snapshot.hasData) {
            final List<RestaurantModel> data = mapData(snapshot.data);
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return _buildRestaurantItem(context, data[index]);
                });
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _restaurantRating(BuildContext context, num rating) {
    return Container(
        child: Row(
      children: <Widget>[
        Icon(
          Icons.star_rate,
          color: Colors.amber,
        ),
        Text(
          "$rating",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    ));
  }

  Widget _imageWithRating(BuildContext context, RestaurantModel data) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              data.imageUrl,
              width: 100,
              height: 500,
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  Widget _buildRestaurantItem(BuildContext context, RestaurantModel data) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: _imageWithRating(context, data),
      title: Text(
        data.name,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        data.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.pushNamed(context, DetailRestaurant.routeName,
            arguments: data);
      },
    );
  }
}
