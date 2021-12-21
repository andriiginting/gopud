import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/resto_repository.dart';
import 'package:restaurant_app/helper/restaurant_constant.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/resto/detail_restaurant.dart';

class ListRestaurantPage extends StatelessWidget {
  static const routeName = '/resto_list';
  final RestoRepository repository = RestoRepository();

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
      body: FutureBuilder<List<RestaurantModel>>(
        future: repository.getListRestaurant(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RestaurantModel>> snapshot) {
          if (snapshot.hasError) {
            return Text("Snapshot ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<RestaurantModel>? data = snapshot.data;
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return _buildRestaurantItem(context, data![index]);
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _imageWithRating(BuildContext context, RestaurantModel data) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: RestaurantConstant.imageBaseUrl + data.imageUrl,
              width: 100,
              height: 500,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailRestaurant(merchantId: data.id)));
      },
    );
  }
}
