import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/banner_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/category_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/now_playing_movie_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/section_title_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/upcoming_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
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
