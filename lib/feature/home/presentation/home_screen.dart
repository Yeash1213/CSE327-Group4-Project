import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/route/app_route_name.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/banner_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/category_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/now_playing_movie_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/section_title_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/upcoming_movie_widget.dart';

/// The `HomeScreen` class in the provided Dart code is a StatelessWidget that represents the main
/// screen of a movie ticket booking application.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cine Ticket'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, AppRouteName.wishlist);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
         /// The `child` property of the `Column` widget in the `build` method of the `HomeScreen` class
        /// is defining the layout structure of the home screen of a movie ticket booking application.
        /// Here's a breakdown of what each child widget is doing:
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Welcome to Cine Ticket",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Book your favorite Movie here!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: BannerWidget(),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SectionTitleWidget(title: "Category"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: CategoryWidget(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SectionTitleWidget(title: "Now Playing"),
            ),
            const SizedBox(height: 16),
            const NowPlayingMovieWidget(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SectionTitleWidget(title: "Upcoming"),
            ),
            const SizedBox(height: 16),
            const UpcomingMovieWidget(),
          ],
        ),
      ),
    );
  }
}
