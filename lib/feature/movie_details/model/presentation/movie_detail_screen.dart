import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/route/app_route_name.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/feature/home/model/movie_model.dart';
import 'package:flutter_application_1/feature/movie_details/model/presentation/widget/movie_info_widget.dart';

/// The above class is a Dart widget for displaying details of a movie in a screen.
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});
  
  /// The `@override` annotation in Dart is used to indicate that a method is overriding a method from a
  /// superclass. In this case, the `build` method in the `MovieDetailScreen` class is overriding the
  /// `build` method from the `StatelessWidget` class.
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Movie Detail",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      
        /// The `body` property in the `Scaffold` widget of the `MovieDetailScreen` class is defining the
      /// main content of the screen. In this case, it is setting the body of the screen to a
      /// `SingleChildScrollView` widget with padding of 24 pixels on all sides.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
                   /// This part of the code is creating a layout for displaying an image related to the movie
         /// within a `SizedBox` widget. Here's a breakdown of what each component does:
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                            movie.assetImage,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MovieInfoWidget(
                        iconData: Icons.videocam_rounded,
                        title: "Genre",
                        value: movie.type,
                      ),
                      MovieInfoWidget(
                        iconData: Icons.access_time_filled_rounded,
                        title: "Duration",
                        value: movie.duration,
                      ),
                      MovieInfoWidget(
                        iconData: Icons.stars_rounded,
                        title: "Rating",
                        value: movie.rating,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(height: 32),
            Text(
              "Synopsis",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              movie.synopsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
       /// The code block you provided is defining a floating action button that allows users to navigate
      /// to the movie booking screen when tapped. Here's a breakdown of what each component does:
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRouteName.movieBooking,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Text(
            "Booking Now",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
