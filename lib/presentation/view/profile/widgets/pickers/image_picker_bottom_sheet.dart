import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/custom_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/container/image_picker_icon_button.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

imagePickerBottomSheet({
  required BuildContext context,
  required ProfileViewModel profileViewModel,
}) {
  customBottomSheet(
    context: context,
    title: LocaleKeys.profile_info_profil_photo.tr(),
    body: Padding(
      padding: context.paddings.horizontalMedium1,
      child: Row(
        children: [
          ImagePickerIcon(
            onTap: () async {
              context.pop();
              profileViewModel.getImageFromCamera();
            },
            icon: AppIcons.kCameraIcon,
            text: LocaleKeys.profile_info_camera.tr(),
          ),
          context.sizedBoxWidthMedium2,
          ImagePickerIcon(
            onTap: () async {
              context.pop();
              profileViewModel.getImageFromGallery();
            },
            icon: AppIcons.kGalleryIcon,
            text: LocaleKeys.profile_info_gallery.tr(),
          ),
          context.sizedBoxWidthMedium2,
          Visibility(
            visible: profileViewModel.profilPhotoUrl != '',
            child: ImagePickerIcon(
              onTap: () {
                profileViewModel.profilPhotoUrl = '';
                context.pop();
              },
              icon: AppIcons.kRemoveIcon,
              text: LocaleKeys.profile_info_remove.tr(),
            ),
          ),
        ],
      ),
    ),
  );
}
