import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';

/// The SeatWidget class is a stateless widget in Dart that represents a seat with customizable
/// properties such as seat number, dimensions, selection status, and availability.
class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatNumber,
    this.onTap,
    this.height = 50,
    this.width = 50,
    this.isSelected = false,
    this.isAvailable = true,
  });
  
/// These lines are declaring the properties (variables) of the `SeatWidget` class in Dart. Here's a
/// breakdown of each property:
  final void Function()? onTap;
  final String seatNumber;
  final double width;
  final double height;
  final bool isSelected;
  final bool isAvailable;
 /// This function builds a widget representing a seat with specific styling based on availability and
 /// selection status.
 /// 
 /// Args:
 ///   context (BuildContext): In Flutter, the `BuildContext` class represents the location of a widget
 /// in the widget tree. It is used to access information about the location of the widget in the widget
 /// tree, such as theme data, media queries, and more.
 /// 
 /// Returns:
 ///   A GestureDetector widget is being returned, which contains a Container widget. The Container
 /// widget has a BoxDecoration with conditional color based on the isAvailable and isSelected
 /// variables. Inside the Container, there is a Text widget displaying the seatNumber with a style
 /// based on the isAvailable variable.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isAvailable
              ? isSelected
                  ? AppColor.primaryColor
                  : AppColor.white
              : Colors.grey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isAvailable
                ? isSelected
                    ? AppColor.primaryColor
                    : Colors.grey
                : Colors.grey,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          seatNumber,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isAvailable
                    ? AppColor.black
                    : AppColor.black.withOpacity(0.6),
              ),
        ),
      ),
    );
  }
}

/// The SeatInfoWidget class displays information about different seat states in a row layout.
class SeatInfoWidget extends StatelessWidget {
  const SeatInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Reserved",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: true,
        ),
        const SizedBox(width: 4),
        Text(
          "Selected",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Available",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
