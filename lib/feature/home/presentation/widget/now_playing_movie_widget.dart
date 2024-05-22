import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/route/app_route_name.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/feature/home/model/movie_model.dart';

/// The `NowPlayingMovieWidget` class is a StatefulWidget that displays a carousel of now playing movies
/// with a center item that is enlarged.
class NowPlayingMovieWidget extends StatefulWidget {
  const NowPlayingMovieWidget({super.key});

  @override
  State<NowPlayingMovieWidget> createState() => _NowPlayingMovieWidgetState();
}

class _NowPlayingMovieWidgetState extends State<NowPlayingMovieWidget> {
  int centerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: CarouselSlider.builder(
        itemCount: upcoming.length,
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          initialPage: centerIndex,
          viewportFraction: 0.7,
          onPageChanged: (index, reason) {
            setState(() {
              centerIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, _) {
          return _NowPlayingItem(
            movie: nowPlayingMovie[index],
            isCenter: index == centerIndex,
          );
        },
      ),
    );
  }
}
/// The `_NowPlayingItem` class is a `StatefulWidget` that represents an item displayed in the carousel
/// of now playing movies. It takes two parameters in its constructor:
/// 1. `movie`: A required parameter of type `Movie` which represents the movie data to be displayed.
/// 2. `isCenter`: An optional parameter of type `bool` with a default value of `false`, indicating
/// whether the item is currently at the center of the carousel.
class _NowPlayingItem extends StatefulWidget {
  const _NowPlayingItem({
    required this.movie,
    this.isCenter = false,
  });

  final Movie movie;
  final bool isCenter;

  @override
  State<_NowPlayingItem> createState() => __NowPlayingItemState();
}
/// The __NowPlayingItemState class in Dart represents a widget for displaying movie details with an
/// option to navigate to the movie detail screen upon tapping.
class __NowPlayingItemState extends State<_NowPlayingItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouteName.movieDetail,
          arguments: widget.movie,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(
                    widget.movie.assetImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: widget.isCenter
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          "Buy Ticket",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColor.white),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.movie.title,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
