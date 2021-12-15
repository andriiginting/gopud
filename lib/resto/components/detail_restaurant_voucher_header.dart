import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailVoucherHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black12,
          )),
      margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 16),
      child: Column(
        children: [_voucherAmountView(context), _voucherAvailableView(context)],
      ),
    );
  }

  Widget _voucherAmountView(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/image/voucher.png",
              height: 36,
              width: 36,
            ),
            Expanded(
                flex: 3,
                child: Container(
                    margin:
                        EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "6 Discounts are available",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ))),
            Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey,
                ))
          ],
        ));
  }

  Widget _voucherAvailableView(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
        color: Colors.black12,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  "assets/image/discount.png",
                  height: 16,
                  width: 16,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 12, top: 0, right: 12, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "35% off food + 12k off delivery.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ))),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  "assets/image/discount.png",
                  height: 16,
                  width: 16,
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                        margin:
                        EdgeInsets.only(left: 12, top: 0, right: 12, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "35% off food + 12k off delivery.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ))),
              ],
            )
          ],
        ));
  }
}
