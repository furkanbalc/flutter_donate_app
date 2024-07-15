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
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ProfileViewModel _profileViewModel;
  late AddressViewModel _addressViewModel;

  @override
  void initState() {
    super.initState();
    _profileViewModel = ref.read(profileViewModelImp);
    _addressViewModel = ref.read(addressViewModelImp);
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    _addressViewModel = ref.watch(addressViewModelImp);
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            HomeSliverAppBar(
              profileViewModel: _profileViewModel,
              addressViewModel: _addressViewModel,
            )
          ];
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
                onPressed: () {},
                backgroundColor: AppColors.electricViolet,
                shape: BoxShape.circle,
                icon: Icon(AppIcons.kLikeIcon, color: AppColors.whiteColor, size: AppSizes.high3.value),
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
