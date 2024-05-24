import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/movie_wishlist/model/wishlist_model.dart';

class WishlistItemWidget extends StatelessWidget {
  final WishlistMovie movie;

  WishlistItemWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(movie.posterUrl),
        title: Text(movie.title),
        subtitle: Text(movie.description),
      ),
    );
  }
}
