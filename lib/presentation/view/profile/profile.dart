import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/sign_out_service.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/profile/profile_list_tile_widget.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_profile_section_shimmer.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/profile/profile_header_info.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> with SignOutService {
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    super.initState();
    _profileViewModel = ref.read(profileViewModelImp);
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.profile_my_profile.tr()),
      body: _buildBody(context),
    );
  }

  /// Profile Body
  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        ProfileHeaderInfo(profileViewModel: _profileViewModel),
        context.sizedBoxHeightMedium,
        Expanded(child: _profileItemList(context)),
      ],
    );
  }

  /// Profile Item List
  Widget _profileItemList(BuildContext context) {
    return Container(
      padding: context.paddings.horizontalMedium + context.paddings.onlyTopMedium,
      color: AppColors.whiteColor,
      child: Column(
        children: [
          ProfileListTileWidget(
            title: LocaleKeys.profile_my_profile_info.tr(),
            icon: AppIcons.kUserOutlinedIcon,
            onPressed: () {
              context.goNamed(AppRouteName.profileInfos.name);
            },
          ),
          _buildDivider(),
          ProfileListTileWidget(
            title: LocaleKeys.profile_my_address_info.tr(),
            icon: AppIcons.kLocationOutlinedIcon,
            onPressed: () {
              context.goNamed(AppRouteName.addressInfos.name);
            },
          ),
          _buildDivider(),
          ProfileListTileWidget(
            title: LocaleKeys.profile_my_statistics.tr(),
            icon: AppIcons.kStatisticOutlinedIcon,
            onPressed: () {},
          ),
          _buildDivider(),
          ProfileListTileWidget(
            title: LocaleKeys.profile_settings.tr(),
            icon: AppIcons.kSettingsOutlinedIcon,
            onPressed: () {},
          ),
          _buildDivider(),
          ProfileListTileWidget(
            title: LocaleKeys.profile_contact_us.tr(),
            icon: AppIcons.kInfoIcon,
            onPressed: () {
              context.goNamed(AppRouteName.contactUs.name);
            },
          ),
          context.sizedBoxHeightMedium,
          _buildSignOutButton(context),
        ],
      ),
    );
  }

  /// SignOut Button
  Widget _buildSignOutButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyLight),
      onPressed: () => signOutProcess(context: context, profileViewModel: _profileViewModel),
      child: Padding(
        padding: context.paddings.verticalNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(AppIcons.kLogoutIcon),
            context.sizedBoxWidthNormal,
            Text(
              LocaleKeys.profile_sign_out.tr(),
              style: context.textStyles.titleMedium.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  /// Divider
  Widget _buildDivider() => Divider(color: AppColors.steel.withOpacity(.1));
}
