import 'package:flutter/material.dart';
import 'package:robodash/presentation/features/bottom_nav_bar/nav_bar/bottom_nav_bar_view.dart';
import 'package:robodash/presentation/features/control/screens/control_screen.dart';
import 'package:robodash/presentation/features/home/screens/home_screen.dart';
import 'package:robodash/presentation/features/more/screens/more_screen.dart';
import 'package:robodash/presentation/features/splash/screens/splash_screen.dart';
import 'package:robodash/presentation/features/vision/screens/vision_screen.dart';
import 'package:robodash/presentation/features/voice/screens/voice_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash Screen
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      // Home
      case '/navBar':
        return MaterialPageRoute(builder: (_) => BottomNavBarView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/more':
        return MaterialPageRoute(builder: (_) => const MoreScreen());

      // Control
      case '/control':
        return MaterialPageRoute(builder: (_) => ControlScreen());

      // Voice
      case '/voice':
        return MaterialPageRoute(builder: (_) => const VoiceScreen());

      // Vision
      case '/vision':
        return MaterialPageRoute(builder: (_) => const VisionScreen());

      // Unknown route
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('404 - Page not found')),
        );
    }
  }
}
