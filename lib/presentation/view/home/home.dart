import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/auto_page_slider.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/home_sliver_appbar.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/horizontal_product_cart.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/vertical_product_cart.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = ref.read(profileViewModelImp);
  }

  @override
  Widget build(BuildContext context) {
    profileViewModel = ref.watch(profileViewModelImp);
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [HomeSliverAppBar(profileViewModel: profileViewModel)];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: AutoPageSlider()),
            SliverToBoxAdapter(child: buildCatergoriesList(context)),
            SliverToBoxAdapter(child: buildHorizontalList(context)),
            SliverToBoxAdapter(child: buildSectionHeader(context, 'Yakınlardakiler', 'Tümünü Gör')),
            SliverPadding(padding: context.paddings.zero, sliver: buildVerticalList(context)),
          ],
        ),
      ),
    );
  }

  Widget buildCatergoriesList(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.1),
      child: ListView.separated(
        padding: context.paddings.horizontalMedium + context.paddings.onlyTopNormal,
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomIconButton(
                onPressed: () {
                  toastification.show(
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.fillColored,
                    autoCloseDuration: (Durations.extralong4) * 4,
                    title: const Text('Hello, World!'),
                    description: RichText(text: const TextSpan(text: 'This is a sample toast message. ')),
                    alignment: Alignment.topRight,
                    direction: TextDirection.ltr,
                    animationDuration: Durations.medium2,
                    animationBuilder: (context, animation, alignment, child) {
                      return FadeTransition(
                        opacity: kAlwaysCompleteAnimation,
                        child: child,
                      );
                    },
                    icon: Icon(AppIcons.kTickIcon),
                    primaryColor: Colors.green,
                    foregroundColor: Colors.black,
                    closeButtonShowType: CloseButtonShowType.always,
                    closeOnClick: true,
                    dragToClose: true,
                    showProgressBar: false,
                  );
                },
                backgroundColor: AppColors.electricViolet,
                shape: BoxShape.circle,
                icon: Icon(AppIcons.kLikeIcon, color: AppColors.whiteColor, size: AppSizes.custom.value),
              ),
              context.sizedBoxHeightMin,
              Text(
                'Mobilya',
                style: context.textStyles.bodySmall.copyWith(color: AppColors.verifiedBlack),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => context.sizedBoxWidthMedium,
      ),
    );
  }

  Widget buildHorizontalList(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.45),
      child: Column(
        children: [
          buildSectionHeader(context, 'Son Eklenenler', 'Tümünü Gör'),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: context.dynamicWidth(.7),
                  child: const VerticalProductCard(),
                );
              },
              separatorBuilder: (context, index) => context.sizedBoxWidthMin,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerticalList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          return SizedBox(
            height: context.dynamicHeight(.20),
            child: const HorizontalProductCart(),
          );
        },
      ),
    );
  }

  Widget buildSectionHeader(BuildContext context, String title, String actionText) {
    return Padding(
      padding: context.paddings.horizontalMedium + context.paddings.onlyTopNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            actionText,
            style: context.textStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.electricViolet,
            ),
          ),
        ],
      ),
    );
  }
}
