import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRestaurantPaymentInfo extends StatelessWidget {
  final String restaurantName;

  const DetailRestaurantPaymentInfo({Key? key, required this.restaurantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          LinearProgressIndicator(
            color: Colors.redAccent,
            backgroundColor: Colors.white10,
            value: 1,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/image/discount.png",
                  height: 12,
                  width: 12,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  "Wohoo! With certain payment methods at checkout, you'll have  up to 20k",
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ))
              ],
            ),
          ),
          _paymentInfoButton(context, restaurantName)
        ],
      ),
    );
  }

  Widget _paymentInfoButton(BuildContext context, String restaurantName) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3 Items",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  restaurantName,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "172.000",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 20.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
