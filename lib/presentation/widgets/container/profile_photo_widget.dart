import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/string_extension.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_svg_widget.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.badge,
    this.imagePath,
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Badge? badge;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparentColor,
      child: badge == null
          ? Badge(
              offset: const Offset(-15, 120),
              label: const Icon(AppIcons.kEditPhotoIcon, color: Colors.white, size: 20),
              largeSize: 30,
              padding: const EdgeInsets.all(5),
              backgroundColor: AppColors.electricViolet,
              child: Container(
                height: 150,
                width: 150,
                margin: context.paddings.allLow,
                padding: context.paddings.allUltra,
                decoration: BoxDecoration(
                  color: AppColors.cascadingWhite,
                  shape: BoxShape.circle,
                  image: imagePath == null ? null : DecorationImage(image: FileImage(File(imagePath!)),fit: BoxFit.cover),
                ),
                child: imagePath == null
                    ? CustomSvgWidget(
                        svg: AppAssets.profile.toSvg,
                        width: width ?? context.dynamicWidth(.20),
                      )
                    : context.sizedBoxShrink,
              ),
            )
          : null,
    );
  }
}
