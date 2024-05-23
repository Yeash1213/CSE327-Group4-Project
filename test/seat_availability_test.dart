import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/feature/movie_booking/model/presentation/widget/seat_widget.dart';

void main() {
  testWidgets(
      'SeatWidget displays correctly based on availability and selection',
      (WidgetTester tester) async {
    // Create the widget with various states
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SeatWidget(
              seatNumber: '1A',
              isSelected: true,
              isAvailable: true,
            ),
            SeatWidget(
              seatNumber: '1B',
              isSelected: false,
              isAvailable: true,
            ),
            SeatWidget(
              seatNumber: '1C',
              isSelected: false,
              isAvailable: false,
            ),
          ],
        ),
      ),
    ));

    // Verify seat 1A
    expect(find.text('1A'), findsOneWidget);
    Container container = tester.widget(find.byType(Container).first);
    BoxDecoration decoration = container.decoration as BoxDecoration;
    print('Seat 1A color: ${decoration.color}');
    expect(decoration.color, equals(AppColor.primaryColor));

    // Verify seat 1B
    expect(find.text('1B'), findsOneWidget);
    container = tester.widget(find.byType(Container).at(1));
    decoration = container.decoration as BoxDecoration;
    print('Seat 1B color: ${decoration.color}');
    expect(decoration.color, equals(AppColor.white));

    // Verify seat 1C
    expect(find.text('1C'), findsOneWidget);
    container = tester.widget(find.byType(Container).at(2));
    decoration = container.decoration as BoxDecoration;
    print('Seat 1C color: ${decoration.color}');
    expect(decoration.color, equals(Colors.grey));
  });

  testWidgets('SeatWidget onTap callback works when seat is available',
      (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SeatWidget(
          seatNumber: '1A',
          isAvailable: true,
          onTap: () {
            tapped = true;
          },
        ),
      ),
    ));

    // Tap the widget
    await tester.tap(find.byType(SeatWidget));
    await tester.pump();

    // Verify the onTap callback was called
    print('Tapped: $tapped');
    expect(tapped, isTrue);
  });

  testWidgets(
      'SeatWidget onTap callback does not work when seat is not available',
      (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SeatWidget(
          seatNumber: '1A',
          isAvailable: false,
          onTap: () {
            tapped = true;
          },
        ),
      ),
    ));

    // Tap the widget
    await tester.tap(find.byType(SeatWidget));
    await tester.pump();

    // Verify the onTap callback was not called
    print('Tapped: $tapped');
    expect(tapped, isFalse);
  });
}
