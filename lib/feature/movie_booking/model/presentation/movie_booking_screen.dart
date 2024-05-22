import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/feature/movie_booking/model/presentation/widget/seat_widget.dart';

/// The above class is a StatefulWidget for a movie booking screen in Dart.
class MovieBookingScreen extends StatefulWidget {
  const MovieBookingScreen({super.key});

  @override
  State<MovieBookingScreen> createState() => _MovieBookingScreenState();
}

/// The `_MovieBookingScreenState` class is a state class that extends `State<MovieBookingScreen>`.
/// Inside this class, there are three member variables:

class _MovieBookingScreenState extends State<MovieBookingScreen> {
  final selectedSeat = ValueNotifier<List<String>>([]);
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final selectedTime = ValueNotifier<TimeOfDay?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Select Seat",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<List<String>>(
            valueListenable: selectedSeat,
            builder: (context, value, _) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: Text(
                        "Screen",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColor.white),
                      ),
                    ),
                    const Expanded(child: SizedBox()),

                    /// lets make 8 seat horizontal
                    /// and 6 seat vertical
                    for (int i = 1; i <= 6; i++) ...[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int j = 1; j <= 8; j++) ...[
                            SeatWidget(
                              seatNumber: "${String.fromCharCode(i + 64)}$j",
                              width: (MediaQuery.of(context).size.width -
                                      48 -
                                      66) /
                                  8,
                              height: (MediaQuery.of(context).size.width -
                                      48 -
                                      66) /
                                  8,
                              isAvailable: i != 6,
                              isSelected: value.contains(
                                "${String.fromCharCode(i + 64)}$j",
                              ),
                              onTap: () {
                                if (value.contains(
                                  "${String.fromCharCode(i + 64)}$j",
                                )) {
                                  selectedSeat.value = List.from(value)
                                    ..remove(
                                      "${String.fromCharCode(i + 64)}$j",
                                    );
                                } else {
                                  selectedSeat.value = List.from(value)
                                    ..add(
                                      "${String.fromCharCode(i + 64)}$j",
                                    );
                                }
                              },
                            ),
                            // make gap, and in the center wider gap
                            if (i != 8) SizedBox(width: j == 4 ? 16 : 4)
                          ]
                        ],
                      ),
                      if (i != 6) const SizedBox(height: 6)
                    ],
                    const Expanded(child: SizedBox()),
                    const SeatInfoWidget(),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
