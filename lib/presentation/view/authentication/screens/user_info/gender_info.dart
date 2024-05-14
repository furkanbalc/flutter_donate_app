part of 'user_info.dart';

class GenderInfoView extends StatefulWidget {
  const GenderInfoView({super.key});

  @override
  State<GenderInfoView> createState() => _GenderInfoViewState();
}

class _GenderInfoViewState extends State<GenderInfoView> {
  bool isMan = false;
  bool isWoman = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalMedium,
      child: _buildBody(context: context),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return Column(
      children: [
        /// Gender Info Title
        AuthHeader(
          title: LocaleKeys.user_info_tell_us_about_yourself.tr(),
          subTitle: LocaleKeys.user_info_share_your_gender.tr(),
        ),
        context.sizedBoxHeightCustom,
        context.sizedBoxHeightCustom,
        Expanded(
          child: Padding(
            padding: context.paddings.onlyBottomUltra,
            child: Column(
              children: [
                SelectGenderWidget(
                  gender: 'Erkek',
                  svg: AppAssets.man.toSvg,
                  onTap: () {
                    setState(() {
                      if(isWoman) {
                        isMan = true;
                        isWoman = false;
                      } else {
                        isMan = true;
                      }
                    });
                  },
                  isSelect: isMan,
                ),
                context.sizedBoxHeightCustom,
                SelectGenderWidget(
                  gender: 'Kadın',
                  svg: AppAssets.woman.toSvg,
                  onTap: () {
                    setState(() {
                      if(isMan) {
                        isWoman = true;
                        isMan = false;
                      } else {
                        isWoman = true;
                      }
                    });
                  },
                  isSelect: isWoman,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
    required this.gender,
    required this.svg,
    this.isSelect = false,
    required this.onTap,
  });

  final String gender;
  final String svg;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppColors.transparentColor,
      splashFactory: NoSplash.splashFactory,
      child: CircleAvatar(
        maxRadius: context.dynamicWidth(.25),
        backgroundColor: isSelect ? AppColors.electricViolet : AppColors.greyLighter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgWidget(
              svg: svg,
              width: context.dynamicWidth(.3),
              color: isSelect ? null : AppColors.blackColor,
            ),
            Text(
              gender,
              style: context.textStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelect ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
