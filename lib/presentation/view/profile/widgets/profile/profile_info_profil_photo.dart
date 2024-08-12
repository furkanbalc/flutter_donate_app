part of '../../profile_info.dart';

class ProfileInfoProfilePhoto extends StatelessWidget {
  const ProfileInfoProfilePhoto({super.key, required this.profileViewModel});

  final ProfileViewModel profileViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(),
      padding: context.paddings.verticalLow3,
      margin: context.paddings.onlyTopLow3,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
              AppColors.electricViolet.withOpacity(.5), BlendMode.srcIn),
          image: AssetImage(AppPng.linesBg.toPng),
        ),
      ),
      child: Center(
        child: ProfilePhotoWidget(
          imagePath: profileViewModel.profilPhotoUrl,
          padding: context.paddings.allMedium3,
          onTap: () {
            imagePickerBottomSheet(
              context: context,
              profileViewModel: profileViewModel,
            );
          },
        ),
      ),
    );
  }
}
