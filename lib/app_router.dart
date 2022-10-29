import 'package:flutter/material.dart';

PageRouteBuilder animateRouteBuilder(Widget to, {double x = 1, double y = 0}) {
  return PageRouteBuilder(
      pageBuilder: (_, __, ___) => to,
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, animationTime, child) {
        final tween = Tween<Offset>(begin: Offset(x, y), end: Offset.zero);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class RouterApp {
  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   try {
  //
  //   }catch (e) {
  //     return _errorRoute();
  //   }
  // }

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

