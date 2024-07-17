import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/auto_page_slider.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/home_sliver_appbar.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/horizontal_product_cart.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/vertical_product_cart.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/product/product_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_categories_list_shimmer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late ProfileViewModel _profileViewModel;
  late AddressViewModel _addressViewModel;
  late ProductViewModel _productViewModel;

  @override
  void initState() {
    super.initState();
    _profileViewModel = ref.read(profileViewModelImp);
    _addressViewModel = ref.read(addressViewModelImp);
    _productViewModel = ref.read(productViewModelImp);
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    _addressViewModel = ref.watch(addressViewModelImp);
    _productViewModel = ref.watch(productViewModelImp);
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
    switch (_productViewModel.getCategoriesResponse.status) {
      case Status.completed:
        return SizedBox(
          height: context.dynamicHeight(.1),
          child: ListView.separated(
            padding: context.paddings.horizontalMedium + context.paddings.onlyTopNormal,
            itemCount: _productViewModel.getCategoriesResponse.data.categories?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                splashFactory: NoSplash.splashFactory,
                highlightColor: AppColors.transparentColor,
                onTap: () {

                },
                child: Column(
                  children: [
                    CustomSvgWidget(
                      svg: getCategoryIcon(_productViewModel.getCategoriesResponse.data.categories![index].image!),
                      width: context.dynamicWidth(.14),
                      height: context.dynamicWidth(.14),
                    ),
                    context.sizedBoxHeightMin,
                    Text(
                      _productViewModel.getCategoriesResponse.data.categories![index].name!,
                      style: context.textStyles.bodySmall.copyWith(color: AppColors.verifiedBlack),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => context.sizedBoxWidthHigh,
          ),
        );

      default:
        return const CustomCategoriesListShimmer();
    }
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

  String getCategoryIcon(String category) {
    switch (category) {
      case 'tools':
        return AppSvg.tools.toSvg;
      case 'education':
        return AppSvg.education.toSvg;
      case 'sport':
        return AppSvg.sport.toSvg;
      case 'clothes':
        return AppSvg.clothes.toSvg;
      case 'furniture':
        return AppSvg.sofa.toSvg;
      case 'health':
        return AppSvg.health.toSvg;
      case 'pet':
        return AppSvg.pet.toSvg;
      case 'technology':
        return AppSvg.technology.toSvg;
      default:
        return AppSvg.info.toSvg;
    }
  }
}
