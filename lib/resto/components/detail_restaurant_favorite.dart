import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRestaurantFavorite extends StatefulWidget {

  const DetailRestaurantFavorite({Key? key}) : super(key: key);

  @override
  _DetailRestaurantFavoriteState createState() => _DetailRestaurantFavoriteState();
}

class _DetailRestaurantFavoriteState extends State<DetailRestaurantFavorite> {
  bool _isFavorite = false;

  void _handleFavoriteTap() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleFavoriteTap,
      child: Container(
        child: Icon(
          Icons.favorite,
          color: _isFavorite ? Colors.red : Colors.grey,
          size: 20.0,
        ),
      ),
    );
  }
}
