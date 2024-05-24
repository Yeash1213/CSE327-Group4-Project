import 'package:flutter/material.dart';
import 'widget/wishlist_item_widget.dart';
import 'package:flutter_application_1/feature/movie_wishlist/model/wishlist_model.dart';

class MovieWishlistScreen extends StatelessWidget {
  final List<WishlistMovie> wishlistMovies = [
    WishlistMovie(
      title: "Movie 1",
      description: "Description of Movie 1",
      posterUrl: "https://via.placeholder.com/150",
    ),
    WishlistMovie(
      title: "Movie 2",
      description: "Description of Movie 2",
      posterUrl: "https://via.placeholder.com/150",
    ),
    // Add more movies as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistMovies.length,
        itemBuilder: (context, index) {
          return WishlistItemWidget(movie: wishlistMovies[index]);
        },
      ),
    );
  }
}
