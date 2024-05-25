import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';

class AnimatedSnackbar extends StatefulWidget {
  final Function()? onTap;
  final String? title;
  final String message;
  final Color backgroundColor;

  const AnimatedSnackbar({
    required this.onTap,
    required this.title,
    required this.message,
    required this.backgroundColor,
    super.key,
  });

  @override
  State<AnimatedSnackbar> createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<AnimatedSnackbar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  final double _snackbarHeight = 80.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation =
        Tween<Offset>(begin: const Offset(0.0, -2.0), end: const Offset(0.0, 0.5)).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onTap: () {
          _animationController.reverse();
        },
        child: Material(
          elevation: 4,
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: SizedBox(
                height: _snackbarHeight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.title != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.title ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Text(
                              widget.message ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            widget.message ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
