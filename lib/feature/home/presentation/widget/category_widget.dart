import 'package:flutter/material.dart';

/// The above class is a Dart widget named CategoryWidget that extends StatelessWidget and has a
/// constructor with a key parameter.

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

 /// The `final category = const ["Action", "Comedy", "Romance"];` statement in the `CategoryWidget`
 /// class is defining a constant list named `category` that contains three strings: "Action", "Comedy",
 /// and "Romance". The `const` keyword is used to create an immutable (unchangeable) list at
 /// compile-time. This list will not be modified during the execution of the program and its values
 /// cannot be changed.
  final category = const [
    "Action",
    "Comedy",
    "Romance",
  ];

  /// The build function returns a SingleChildScrollView containing a Row of containers representing
  /// categories with specified styling.
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          category.length,
          (index) {
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                category[index],
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          },
        ),
      ),
    );
  }
}

