part of '../../profile.dart';

class ProfileHeaderInfo extends StatelessWidget {
  const ProfileHeaderInfo({super.key, required this.profileViewModel});

  final ProfileViewModel profileViewModel;

  @override
  Widget build(BuildContext context) {
    /// Profile Photo & Username & Email & Gender & Age
    switch (profileViewModel.getUserInfoFromFirestoreResponse.status) {
      case Status.loading:
        return const CustomProfileSectionShimmer();
      case Status.completed:
        return _buildCompleted(context);
      case Status.error:
        return _buildErrorWidget();
      default:
        return const SizedBox();
    }
  }

  /// Build Header
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
          _buildProfilePhotoWidget(context),
          context.sizedBoxWidthMedium,
          buildUserInfo(context),
        ],
      ),
    );
  }

  /// Profile Photo Widget
  Widget _buildProfilePhotoWidget(BuildContext context) {
    return ProfilePhotoWidget(
      badge: false,
      width: context.dynamicWidth(.25),
      height: context.dynamicWidth(.25),
      padding: context.paddings.allUltra,
      imagePath: profileViewModel.getUserProfilPhoto,
    );
  }

  /// User Name & Email & Gender & Age
  Widget buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// User Name
            Text(
              profileViewModel.getUserFullname,
              style: context.textStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            context.sizedBoxWidthNormal,

            /// User Gender
            Icon(profileViewModel.getUserGenderIcon,
                size: 20, color: profileViewModel.isMan ? AppColors.blueTang : AppColors.tomatoFrog),
            context.sizedBoxWidthLow,

            /// User Age
            Text(
              profileViewModel.getUserAge,
              style: context.textStyles.titleSmall.copyWith(
                color: AppColors.steel,
              ),
            ),
          ],
        ),
        Text(
          profileViewModel.getUserEmail,
          style: context.textStyles.titleSmall.copyWith(
            color: AppColors.steel,
          ),
        ),
      ],
    );
  }

  /// Error Widget
  Widget _buildErrorWidget() {
    return CustomErrorWidget(
      onPressed: () {
        profileViewModel.getUserInfoFromFirestore(id: profileViewModel.getUserId);
      },
    );
  }
}
