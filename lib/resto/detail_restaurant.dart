import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/detail_merchant_repository.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/resto/components/detail_restaurant_title.dart';

import 'components/detail_restaurant_drinks_menu.dart';
import 'components/detail_restaurant_header.dart';
import 'components/detail_restaurant_menu.dart';
import 'components/detail_restaurant_menu_v2.dart';
import 'components/detail_restaurant_voucher_header.dart';

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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone_callback),
                        title: Text('Whatsapp'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.copy),
                        title: Text('Copy Link'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.more_horiz),
                        title: Text('More'),
                        onTap: () {},
                      ),
                    ],
                  );
                },
              );
            },
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
      body: FutureBuilder<RestaurantModelV2>(
        future: repository.getMerchantDetail(merchantId),
        builder:
            (BuildContext context, AsyncSnapshot<RestaurantModelV2> snapshot) {
          if (snapshot.hasError) {
            return Text("Snapshot ${snapshot.error}");
          } else if (snapshot.hasData) {
            final restaurantData = snapshot.data!;

            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
              children: [
                RestaurantDetailTitle(restaurantData: restaurantData),
                RestaurantHeader(),
                DetailVoucherHeader(),
                DetailRestaurantFoodMenuV2(menus: restaurantData.menu),
                DetailRestaurantDrinksMenu(menus: restaurantData.menu),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
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
}
