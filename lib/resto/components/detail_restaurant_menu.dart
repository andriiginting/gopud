import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant_model.dart';

class DetailRestaurantMenu extends StatelessWidget {
  final RestaurantMenu menus;

  const DetailRestaurantMenu({Key? key, required this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
          itemCount: menus.foods.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            return _getGridMenuItem(context, menus.foods[index].name);
          });
    });
  }

  Widget _getGridMenuItem(BuildContext context, String menu) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 8,
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
            child: Text(menu,
                style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1)),
        TextButton(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text('Add',
                style: TextStyle(color: Colors.green, fontSize: 14)),
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
