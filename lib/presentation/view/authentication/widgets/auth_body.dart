import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.paddings.horizontalMedium1,
        child: child,
      ),
    );
  }
}
