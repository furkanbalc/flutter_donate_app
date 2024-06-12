import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/context_borders.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class HomeSliverAppBar extends StatefulWidget {
  const HomeSliverAppBar({
    super.key,
    required this.profileViewModel,
    required this.addressViewModel,
  });

  final ProfileViewModel profileViewModel;
  final AddressViewModel addressViewModel;

  @override
  State<HomeSliverAppBar> createState() => _HomeSliverAppbarState();
}

class _HomeSliverAppbarState extends State<HomeSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: context.dynamicHeight(.18),
      backgroundColor: AppColors.electricViolet,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: CustomImageWidget(image: AppPng.linesBg.toPng),
            ),
            Padding(
              padding: context.paddings.allMedium,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.profileViewModel.getUserInfoFromFirestoreResponse.data.data?.userName ?? '', style: context.textStyles.titleSmall.copyWith(color: AppColors.whiteColor)),
                          context.sizedBoxHeightMin,
                          Row(
                            children: [
                              const Icon(AppIcons.kLocationOutlinedIcon, color: AppColors.whiteColor, size: 20),
                              context.sizedBoxWidthLow,
                              Text('Kahramanmaraş, Türkiye',
                                  style: context.textStyles.titleMedium.copyWith(color: AppColors.whiteColor)),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        padding: context.paddings.zero,
                        onPressed: () {},
                        icon: Container(
                          padding: context.paddings.allLow,
                          decoration: BoxDecoration(
                            color: AppColors.blueTang,
                            borderRadius: context.borders.circularBorderRadiusNormal,
                          ),
                          child: const Badge(child: Icon(AppIcons.kNotificationIcon, color: AppColors.whiteColor)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize:  Size.fromHeight(AppSizes.ultra.value),
        child: Padding(
          padding: context.paddings.horizontalMedium + context.paddings.onlyBottomMedium,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: LocaleKeys.home_search.tr(),
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        contentPadding: context.paddings.zero,
                        prefixIcon: const Icon(AppIcons.kSearchIcon, color: AppColors.steel),
                      ),
                    ),
                  ),
                  context.sizedBoxWidthLow,
                  IconButton(
                    style: IconButton.styleFrom(padding: context.paddings.zero),
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: context.borders.circularBorderRadiusNormal,
                      ),
                      child: const Icon(AppIcons.kFilterIcon, color: AppColors.electricViolet),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
