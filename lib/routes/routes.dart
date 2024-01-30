import 'package:flutter/material.dart';

class Navigate {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ///we use this method to navigate to desired Screen.
  Navigate.pushNamed(Widget child) {
    navigatorKey.currentState!.push(pageRouteBuilder(child));
  }

  ///we use this method to push and replace with current page.
  Navigate.pushAndReplace(Widget child) {
    navigatorKey.currentState!.pushReplacement(pageRouteBuilder(child));
  }

  ///we use this method to push and replace with current page.
  Navigate.pushAndRemoveUntil(Widget child) {
    navigatorKey.currentState!
        .pushAndRemoveUntil(pageRouteBuilder(child), (_) => false);
  }

  ///This method will pop the current Route
  Navigate.pop() {
    navigatorKey.currentState!.pop();
  }

  ///This is our page route Builder with animation
  PageRouteBuilder pageRouteBuilder(Widget child) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return leftToRight(context, animation, secondaryAnimation, child);
      },
    );
  }

  ///Animation method to left to right
  SlideTransition leftToRight(context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOutSine;
    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
