import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/detail_merchant_repository.dart';
import 'package:restaurant_app/model/restaurant_model.dart';
import 'package:restaurant_app/resto/components/detail_restaurant_title.dart';

import 'components/detail_restaurant_drinks_menu.dart';
import 'components/detail_restaurant_header.dart';
import 'components/detail_restaurant_menu_v2.dart';
import 'components/detail_restaurant_payment_info.dart';
import 'components/detail_restaurant_voucher_header.dart';

class DetailRestaurant extends StatelessWidget {
  static const routeName = '/resto_detail';
  final String merchantId;
  final String restaurantName;
  final MerchantDetailRepository repository = MerchantDetailRepository();

  DetailRestaurant(
      {Key? key, required this.merchantId, required this.restaurantName});

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

            return Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding:
                      EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                  children: [
                    RestaurantDetailTitle(restaurantData: restaurantData),
                    RestaurantHeader(),
                    DetailVoucherHeader(),
                    DetailRestaurantFoodMenuV2(menus: restaurantData.menu),
                    DetailRestaurantDrinksMenu(menus: restaurantData.menu),
                  ],
                ),
                _paymentInfoWidget(context)
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      // floatingActionButton: _floatingMenuWidget(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _paymentInfoWidget(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _floatingMenuWidget(context),
            _checkoutInfoWidget(context, restaurantName),
          ],
        ));
  }

  Widget _checkoutInfoWidget(BuildContext context, String restaurantName) {
    return Visibility(
        visible: true,
        child: DetailRestaurantPaymentInfo(restaurantName: restaurantName));
  }

  Widget _floatingMenuWidget(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: FittedBox(
        child: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed: () {},
            label: Text("Menu"),
            icon: Icon(Icons.microwave_sharp)),
      ),
    );
  }
}
