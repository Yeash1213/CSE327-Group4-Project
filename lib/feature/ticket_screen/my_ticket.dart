import 'package:flutter/material.dart';

/// The `TicketScreen` class in Dart represents a screen displaying ticket details including date, time,
/// and seat information.
class TicketScreen extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final List<String> seats;

  const TicketScreen({
    Key? key,
    required this.date,
    required this.time,
    required this.seats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${date.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Time: ${time.format(context)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Seats:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            for (var seat in seats)
              Text(
                seat,
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
