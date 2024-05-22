import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';

/// The code snippet provided is defining a Flutter widget called `MovieInfoWidget` that extends
/// `StatelessWidget`.
class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.value,
  });

  final IconData iconData;
  final String title;
  final String value;

  /// The build function returns a Container widget with specified styling and child widgets.
  /// ///   context (BuildContext): The `context` parameter in the `build` method of a Flutter widget
  /// represents the build context of the widget. It is a reference to the location of the widget within
  /// the widget tree. The context provides access to various properties and services higher up in the
  /// widget tree, such as theme data, media
  /// Returns:
  ///   A Container widget is being returned with specified width, decoration, padding, and child widgets
  /// including an Icon, two Text widgets for title and value, and SizedBox widgets for spacing.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
