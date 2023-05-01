import 'package:flutter/material.dart';
import 'package:talks/core/app_router/route_names.dart';
import 'package:talks/presentation/screens/auth_screen.dart';

import '../../presentation/screens/app_layout_screen.dart';
import '../../presentation/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.authScreen:
          return MaterialPageRoute(builder: (BuildContext context) {
            return const AuthScreen();
          });
        case ScreenName.splashScreen:
          return MaterialPageRoute(builder: (BuildContext context) {
            return const SplashScreen();
          });
        case ScreenName.mainLayout:
          return MaterialPageRoute(builder: (BuildContext context) {
            return const MainAppLayout();
          });
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static PageRouteBuilder _animateRouteBuilder(Widget to,
      {double x = 1, double y = 0}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => to,
      transitionDuration: const Duration(milliseconds: 190),
      reverseTransitionDuration: const Duration(milliseconds: 190),
      transitionsBuilder: (context, animation, animationTime, child) {
        final tween = Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }
}
