import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
/// The TimeWidget class is a Flutter widget that displays a time with optional selection styling.
class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.time,
    this.isSelected = false,
  });

  final TimeOfDay time;
  final bool isSelected;
/// This function returns an AnimatedContainer widget displaying a time in a specific format based on
 /// the provided time value and isSelected status.
 /// 
 /// Args:
 ///   context (BuildContext): The `context` parameter in Flutter represents the build context of the
 /// widget. It is a reference to the location of a widget within the widget tree. The context provides
 /// access to various information and services higher up the widget tree, such as theme data, media
 /// queries, and navigation.
 /// 
 /// Returns:
 ///   A `Widget` is being returned. The `build` method returns an `AnimatedContainer` widget with a
 /// specific decoration, padding, margin, alignment, and child (a `Text` widget displaying the time in
 /// a specific format).
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
      alignment: Alignment.center,
      child: Text(
        "${time.hour < 10 ? "0${time.hour}" : "${time.hour}"} : ${time.minute < 10 ? "0${time.minute}" : "${time.minute}"}",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}