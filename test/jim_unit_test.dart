import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/movie_booking/model/presentation/widget/time_widget.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';

void main() {
  testWidgets(
      'TimeWidget displays time correctly and changes color when selected',
      (WidgetTester tester) async {
    // Define a test time
    const testTime = TimeOfDay(hour: 9, minute: 5);

    // Create the widget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: TimeWidget(time: testTime, isSelected: true),
      ),
    ));

    // Verify the time is displayed correctly
    expect(find.text('09 : 05'), findsOneWidget);

    // Verify the background color when selected
    AnimatedContainer container =
        tester.widget(find.byType(AnimatedContainer).first);
    BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(decoration.color, equals(AppColor.primaryColor.withOpacity(0.8)));

    // Change isSelected to false and test again
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: TimeWidget(time: testTime, isSelected: false),
      ),
    ));

    // Verify the background color when not selected
    container = tester.widget(find.byType(AnimatedContainer).first);
    decoration = container.decoration as BoxDecoration;
    expect(decoration.color, equals(AppColor.primaryColor.withOpacity(0.1)));
  });
}
