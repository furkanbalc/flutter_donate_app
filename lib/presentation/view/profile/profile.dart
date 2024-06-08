import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/sign_out_service.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/profile_list_tile_widget.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer_widget.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: AppColors.cascadingWhite,
      appBar: CustomAppBar(title: LocaleKeys.profile_my_profile.tr()),
      body: _buildBody(context),
    );
  }

  /// Profile Photo & Username & Email & Gender & Age
  Widget _buildProfileHeader(BuildContext context) {
    switch (_profileViewModel.getUserInfoFromFirestoreResponse.status) {
      case Status.loading:
        return const ShimmerWidget();
      case Status.completed:
        return _buildCompleted(context);
      case Status.error:
        return CustomErrorWidget(
          onPressed: () {
            _profileViewModel.getUserInfoFromFirestore(id: _profileViewModel.getUserId);
          },
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildCompleted(BuildContext context) {
    return Container(
      padding: context.paddings.allLow,
      margin: context.paddings.onlyTopNormal,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(AppColors.electricViolet.withOpacity(.3), BlendMode.srcIn),
          image: AssetImage(AppPng.linesBg.toPng),
        ),
      ),
      child: Row(
        children: [
          ProfilePhotoWidget(
            badge: false,
            width: context.dynamicWidth(.25),
            height: context.dynamicWidth(.25),
            padding: context.paddings.allUltra,
            imagePath: _profileViewModel.getUserProfilPhoto,
          ),
          context.sizedBoxWidthMedium,
          _buildProfileInfo(context),
        ],
      ),
    );
  }

  /// User name & email & age & gender
  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              _profileViewModel.getUserFullname,
              style: context.textStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            context.sizedBoxWidthNormal,
            Icon(_profileViewModel.getUserGenderIcon,
                size: 20, color: _profileViewModel.isMan ? AppColors.blueTang : AppColors.tomatoFrog),
            context.sizedBoxWidthLow,
            Text(
              _profileViewModel.getUserAge,
              style: context.textStyles.titleSmall.copyWith(
                color: AppColors.steel,
              ),
            ),
          ],
        ),
        Text(
          _profileViewModel.getUserEmail,
          style: context.textStyles.titleSmall.copyWith(
            color: AppColors.steel,
          ),
        ),
      ],
    );
  }

  /// Profile Body
  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildProfileHeader(context),
        context.sizedBoxHeightMedium,
        Expanded(
          child: Container(
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
                  onPressed: () {},
                ),
                context.sizedBoxHeightMedium,
                _buildSignOutButton(context),
              ],
            ),
          ),
        ),
      ],
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
