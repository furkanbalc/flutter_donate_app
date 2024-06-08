import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/container/image_picker_icon_button.dart';
import 'package:go_router/go_router.dart';

imagePickerSheet({
  required BuildContext context,
  required ProfileViewModel profileViewModel,
}) {
  customBottomSheet(
    context: context,
    title: 'Profil Fotoğrafı',
    body: Padding(
      padding: context.paddings.horizontalMedium,
      child: Row(
        children: [
          ImagePickerIcon(
            onTap: () async {
              context.pop();
              profileViewModel.getImageFromCamera();
            },
            icon: AppIcons.kCameraIcon,
            text: 'Kamera',
          ),
          context.sizedBoxWidthHigh,
          ImagePickerIcon(
            onTap: () async {
              context.pop();
              profileViewModel.getImageFromGallery();
            },
            icon: AppIcons.kGalleryIcon,
            text: 'Galeri',
          ),
          context.sizedBoxWidthHigh,
          Visibility(
            visible: profileViewModel.profilPhotoUrl != '',
            child: ImagePickerIcon(
              onTap: () {
                profileViewModel.profilPhotoUrl = '';
                context.pop();
              },
              icon: AppIcons.kRemoveIcon,
              text: 'Kaldır',
            ),
          ),
        ],
      ),
    ),
  );
}
