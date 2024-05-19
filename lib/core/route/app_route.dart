import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/route/app_route_name.dart';
import 'package:flutter_application_1/feature/home/presentation/home_screen.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }
    return null;
  }
}
