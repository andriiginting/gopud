import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/resto_detail';
  final RestaurantModel restaurantData;

  const DetailRestaurant(this.restaurantData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Text(
                      restaurantData.name,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          restaurantData.imageUrl,
                          width: 20,
                          height: 50,
                          fit: BoxFit.cover,
                        )))
              ],
            ),
            SizedBox(height: 24),
            Expanded(child: _buildGridMenu(context, restaurantData))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {},
          label: Text("Menu"),
          icon: Icon(Icons.microwave_sharp)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildGridMenu(BuildContext context, RestaurantModel data) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: data.menu.foods
          .map((food) => GestureDetector(
                onTap: () {},
                child: _getGridMenuItem(context, food),
              ))
          .toList(),
    );
  }

  Widget _getGridMenuItem(BuildContext context, FoodsMenu food) {
    return Column(
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Stack(
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
              margin: const EdgeInsets.all(4),
              decoration:
                  ShapeDecoration(color: Colors.white, shape: CircleBorder()),
              child: IconButton(
                icon: Icon(Icons.favorite, color: Colors.black26,),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Text(
            food.name,
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            maxLines: 1
        ),
      ],
    );
  }
}
