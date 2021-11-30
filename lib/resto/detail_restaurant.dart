import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/detail_merchant_repository.dart';
import 'package:restaurant_app/helper/restaurant_constant.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/resto_detail';
  final String merchantId;
  final MerchantDetailRepository repository = MerchantDetailRepository();

  DetailRestaurant({Key? key, required this.merchantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black54,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            color: Colors.black54,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info),
            color: Colors.black54,
          )
        ],
      ),
      body: FutureBuilder<RestaurantModelV2> (
        future: repository.getMerchantDetail(merchantId),
        builder: (BuildContext context, AsyncSnapshot<RestaurantModelV2> snapshot) {
          if (snapshot.hasError) {
            return Text("Snapshot ${snapshot.error}");
          } else if (snapshot.hasData ) {
            final restaurantData = snapshot.data!;

            return Container(
              child: Column(
                children: <Widget>[
                  Row(
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
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                RestaurantConstant.imageBaseUrl + restaurantData.imageUrl,
                                width: 20,
                                height: 50,
                                fit: BoxFit.cover,
                              )))
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: _restaurantRating(context, restaurantData.rating),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                      child: _buildRecommendedMenu(context, restaurantData)
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {},
          label: Text("Menu"),
          icon: Icon(Icons.microwave_sharp)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildRecommendedMenu(BuildContext context, RestaurantModelV2 data) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: data.menu.foods
            .map((food) => GestureDetector(
                  onTap: () {},
                  child: _getGridMenuItem(context, food.name),
                ))
            .toList()
              ..addAll(data.menu.drinks.map((drink) => GestureDetector(
                  onTap: () {},
                  child: _getGridMenuItem(context, drink.name)))));
  }

  Widget _restaurantRating(BuildContext context, num rating) {
    return Container(
        child: Row(
      children: <Widget>[
        Icon(
          Icons.star_rate,
          size: 12,
          color: Colors.orange,
        ),
        Text(
          "$rating",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Colors.black,
          ),
        )
      ],
    ));
  }

  Widget _getGridMenuItem(BuildContext context, String food) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "https://source.unsplash.com/300x300/?foods",
                      //temporary images
                      width: 170,
                      height: 170,
                      fit: BoxFit.cover,
                    )),
                Container(
                  child: TextButton(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black26,
                      size: 16,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(const CircleBorder())),
                    onPressed: () {},
                  ),
                ),
              ],
            )),
        Expanded(
            flex: 1,
            child: Text(food,
                style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1)),
        TextButton(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text('Add',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 14
                )),
          ),
          style: TextButton.styleFrom(
            primary: Colors.green,
            onSurface: Colors.yellow,
            fixedSize: const Size.fromWidth(double.maxFinite),
            side: BorderSide(color: Colors.green),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          onPressed: () {
            print('Pressed');
          },
        ),
      ],
    );
  }
}
