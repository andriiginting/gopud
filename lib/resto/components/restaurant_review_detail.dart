import 'package:flutter/material.dart';

class RestaurantReviewDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
            return Container();
        },
      ),
    );
  }

}