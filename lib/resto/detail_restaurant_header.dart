import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.black12,
        )
      ),
      margin: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 16),
      padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          _deliveryIconView(context),
          _deliveryFeeView(context)
        ],
      ),
    );
  }

  Widget _deliveryIconView(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Image.asset(
          "assets/image/electric_bike.png",
          height: 36,
          width: 36,
        ),
        Expanded(
            flex: 3,
            child: Container(
                margin: EdgeInsets.only(left: 12, top: 0, right: 12, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Delivery in 22 min",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    )
                  ],
                ))),
        Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text('Change',
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
    ));
  }

  Widget _deliveryFeeView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, top: 10, right: 12, bottom: 8),
      child: Row(
        children: [
          Image.asset(
            "assets/image/food_delivery.png",
            height: 16,
            width: 16,
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 12, top: 0, right: 12, bottom: 0),
            child: Text(
              "Delivery fee: 2k (With delivery discount applied,\ndetails below)",
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                fontSize: 10,
                color: Colors.black54,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
