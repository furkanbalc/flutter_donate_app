import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/widgets/container/image_picker_icon_button.dart';

customImagePickerBottomSheet({
  required BuildContext context,
  VoidCallback? cameraTap,
  VoidCallback? galleryTap,
  VoidCallback? removeTap,
}) {
  customBottomSheet(
    context: context,
    title: 'Profil Fotoğrafı',
    body: Padding(
      padding: context.paddings.horizontalMedium,
      child: Row(
        children: [
          ImagePickerIcon(
            onTap: cameraTap,
            icon: AppIcons.kCameraIcon,
            text: 'Kamera',
          ),
          context.sizedBoxWidthHigh,
          ImagePickerIcon(
            onTap: galleryTap,
            icon: AppIcons.kGalleryIcon,
            text: 'Galeri',
          ),
          context.sizedBoxWidthHigh,
          Visibility(
            visible: removeTap != null,
            child: ImagePickerIcon(
              onTap: removeTap,
              icon: AppIcons.kRemoveIcon,
              text: 'Kaldır',
            ),
          ),
        ],
      ),
    ),
  );
}
