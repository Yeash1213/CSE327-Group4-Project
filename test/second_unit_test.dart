import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/movie_booking/model/presentation/movie_booking_screen.dart';
import 'package:flutter_application_1/feature/ticket_screen/my_ticket.dart'; // Import the ticket screen
void main() {
  testWidgets('MovieBookingScreen initializes correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MovieBookingScreen(),
    ));

    // Verify the initial state
    expect(find.text('Select Seat'), findsOneWidget);
    expect(find.text('Select Date'), findsOneWidget);
    expect(find.text('Total Price'), findsOneWidget);
    expect(find.text('Book Now'), findsOneWidget);
  });

  testWidgets('Seat selection changes state', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MovieBookingScreen(),
    ));

    // Select a seat
    await tester.tap(find.text('A1'));
    await tester.pump();

    // Verify the seat is selected
    debugPrint("Seat A1 selected");
    expect(find.text('A1'), findsOneWidget);
    expect(find.text('৳400'), findsOneWidget); // Check the price update
  });

  testWidgets('Date selection changes state', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MovieBookingScreen(),
    ));

    // Select a date
    final date = DateTime.now().add(const Duration(days: 1)).day.toString();
    await tester.tap(find.text(date));
    await tester.pump();

    // Verify the date is selected
    debugPrint("Date $date selected");
    expect(find.text(date), findsOneWidget);
  });

  testWidgets('Time selection changes state', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MovieBookingScreen(),
    ));

    // Select a time
    await tester.tap(find.text('12 : 00'));
    await tester.pump();

    // Verify the time is selected
    debugPrint("Time 12 : 00 selected");
    expect(find.text('12 : 00'), findsOneWidget);
  });

  testWidgets(
      'Book Now button navigates to TicketScreen when conditions are met',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MovieBookingScreen(),
    ));

    // Select a seat
    await tester.tap(find.text('A1'));
    await tester.pump();

    // Select a time
    await tester.tap(find.text('12 : 00'));
    await tester.pump();

    // Tap the "Book Now" button
    await tester.tap(find.text('Book Now'));
    await tester.pumpAndSettle();

    // Verify navigation to TicketScreen
    debugPrint("Navigated to TicketScreen");
    expect(find.byType(TicketScreen), findsOneWidget);
  });

  testWidgets('Book Now button shows a SnackBar when conditions are not met',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MovieBookingScreen(),
    ));

    // Tap the "Book Now" button without selecting seat or time
    await tester.tap(find.text('Book Now'));
    await tester.pump();

    // Verify SnackBar is shown
    debugPrint("SnackBar shown");
    expect(find.text('Please select time and seat(s)'), findsOneWidget);
  });
}
