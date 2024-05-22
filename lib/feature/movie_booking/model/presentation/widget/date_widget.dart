import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/core/utils/date_time_extension.dart';
/// The `DateWidget` class in Dart is a stateless widget that displays a date with optional selection
/// styling.
class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.date,
    this.isSelected = false,
  });
  /// The lines `final DateTime date;` and `final bool isSelected;` in the `DateWidget` class are
  /// declaring two final instance variables within the class.
  final DateTime date;
  final bool isSelected;
/// This Dart function builds a widget with animated containers and text elements based on the
 /// isSelected property.
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColor.primaryColor.withOpacity(0.8)
            : AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            date.monthName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColor.white : null,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              date.day.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: isSelected ? AppColor.black : null),
            ),
          ),
        ],
      ),
    );
  }
}
