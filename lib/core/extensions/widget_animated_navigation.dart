import 'package:flutter/cupertino.dart';

extension AnimatedNavigation on Widget {
  Future fadeTransitionPush(BuildContext context) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );

  Future fadeTransitionReplace(BuildContext context) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );

  Future slideTransitionPush(BuildContext context) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );

  Future slideTransitionReplace(BuildContext context) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500),
        ),
      );

  Future scaleTransitionPush(BuildContext context) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      );

  Future scaleTransitionReplace(BuildContext context) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
      );

  Future rotateTransitionPush(BuildContext context) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        ),
      );

  Future rotateTransitionReplace(BuildContext context) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        ),
      );

  Future sizeTransitionPush(BuildContext context) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
        ),
      );

  Future sizeTransitionReplace(BuildContext context) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
        ),
      );

  Future fadeScaleTransitionPush(BuildContext context) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return this;
          },
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        ),
      );
}
