import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/home/presentation/widget/category_widget.dart';

void main() {
  testWidgets('CategoryWidget displays categories correctly',
      (WidgetTester tester) async {
    // Build the CategoryWidget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CategoryWidget(),
        ),
      ),
    );

    // Verify that the correct number of categories are displayed
    expect(find.text('Action'), findsOneWidget);
    expect(find.text('Comedy'), findsOneWidget);
    expect(find.text('Romance'), findsOneWidget);

    // Verify the number of Containers (one for each category)
    expect(find.byType(Container), findsNWidgets(3));

    // Verify that the Containers have the correct styles
    final containers = tester.widgetList<Container>(find.byType(Container));
    for (var container in containers) {
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
      expect(decoration.border!.top.color, equals(Colors.grey));
      expect(decoration.borderRadius, equals(BorderRadius.circular(16)));
    }
  });
}
