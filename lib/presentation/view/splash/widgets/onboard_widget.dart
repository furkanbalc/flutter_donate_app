part of '../onboard.dart';

class _OnboardWidget extends ConsumerStatefulWidget {
  const _OnboardWidget({
    super.key,
    required this.onBoardingModel,
    required this.splashViewModel,
  });

  final OnBoardingModel onBoardingModel;
  final SplashViewModel splashViewModel;

  @override
  ConsumerState createState() => _OnboarWidgetState();
}

class _OnboarWidgetState extends ConsumerState<_OnboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: CustomImageWidget(
            image: widget.onBoardingModel.img,
            height: context.dynamicHeight(.6),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: context.paddings.onlyBottomUltra,
          child: Center(
            child: CustomImageWidget(
              image: AppAssets.ellips.toPng,
              color: AppColors.electricViolet,
            ),
          ),
        ),

        /// Onbard Bottom Widget
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomClipPathContainer(
            title: widget.onBoardingModel.title,
            subTitle: widget.onBoardingModel.subTitle,
            desc: widget.onBoardingModel.desc,
          ),
        ),
      ],
    );
  }
}
