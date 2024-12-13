import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  @override
  final RouteSettings settings;

  CustomPageRoute({
    required this.page,
    RouteSettings? settings,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  })  : settings = settings ?? const RouteSettings(),
        super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          reverseTransitionDuration: duration, // 添加返回动画持续时间
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
