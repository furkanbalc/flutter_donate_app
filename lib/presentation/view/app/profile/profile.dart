import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/firebase_service/sign_out_service.dart';
import 'package:flutter_donate_app/presentation/view/app/widgets/profile/profile_list_tile_widget.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(
        title: const Text(
          'Profilim',
          style: TextStyle(fontSize: 18, color: AppColors.blackColor),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        /// Update Profile Photo
        Row(
          children: [
            ProfilePhotoWidget(
              badge: false,
              width: context.dynamicWidth(.25),
              height: context.dynamicWidth(.25),
              padding: EdgeInsets.all(24),
              onTap: () {},
            ),
            context.sizedBoxWidthMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _profileViewModel.getUsername,
                  style: context.textStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  _profileViewModel.getUserEmail,
                  style: context.textStyles.titleSmall.copyWith(
                    color: AppColors.steel,
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: context.paddings.horizontalMedium + context.paddings.onlyTopMedium,
            child: ListView(
              padding: context.paddings.zero,
              children: [
                ProfileListTileWidget(
                  title: 'Profil Bilgilerim',
                  icon: AppIcons.kUserOutlinedIcon,
                  onPressed: () {},
                ),
                Divider(color: AppColors.steel.withOpacity(.1)),
                ProfileListTileWidget(
                  title: 'Adres Bilgilerim',
                  icon: AppIcons.kLocationOutlinedIcon,
                  onPressed: () {},
                ),
                Divider(color: AppColors.steel.withOpacity(.1)),
                ProfileListTileWidget(
                  title: 'İstatistiklerim',
                  icon: AppIcons.kStatisticOutlinedIcon,
                  onPressed: () {},
                ),
                Divider(color: AppColors.steel.withOpacity(.1)),
                ProfileListTileWidget(
                  title: 'Ayarlar',
                  icon: AppIcons.kSettingsOutlinedIcon,
                  onPressed: () {},
                ),
                Divider(color: AppColors.steel.withOpacity(.1)),
                ProfileListTileWidget(
                  title: 'Bize Ulaşın',
                  icon: AppIcons.kInfoIcon,
                  onPressed: () {},
                ),
                Divider(color: AppColors.steel.withOpacity(.1)),
                ProfileListTileWidget(
                  title: 'Çıkış Yap',
                  icon: AppIcons.kLogoutIcon,
                  color: AppColors.redColor,
                  onPressed: () {},
                ),
                CustomElevatedButton(
                  onPressed: () => signOutProcess(context: context, profileViewModel: _profileViewModel),
                  text: 'Çıkış Yap',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
