import 'package:flutter/material.dart';

class CustomerSupportWidget extends StatelessWidget {
  const CustomerSupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Support",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 16),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.support_agent,
                size: 50,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: "Your Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: "Problem Description",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Contact us: 0176XXXXXXX",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement your live chat logic here
              },
              child: const Text("Live Chat Now"),
            ),
          ),
        ],
      ),
    );
  }
}
