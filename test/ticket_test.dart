import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/feature/ticket_screen/my_ticket.dart';

void main() {
  testWidgets('TicketScreen displays correct information',
      (WidgetTester tester) async {
    final date = DateTime.now();
    const time = TimeOfDay(hour: 14, minute: 0);
    final seats = ['A1', 'A2'];

    await tester.pumpWidget(MaterialApp(
      home: TicketScreen(date: date, time: time, seats: seats),
    ));

    // Verify the date is displayed correctly
    expect(find.text('Date: ${date.toLocal().toString().split(' ')[0]}'),
        findsOneWidget);

    // Verify the time is displayed correctly
    expect(
        find.text(
            'Time: ${time.format(tester.element(find.byType(TicketScreen)))}'),
        findsOneWidget);

    // Verify the seats are displayed correctly
    for (var seat in seats) {
      expect(find.text(seat), findsOneWidget);
    }
  });
}
