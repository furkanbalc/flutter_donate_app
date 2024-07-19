import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/auto_page_slider.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/categories_list_widget.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/home_sliver_appbar.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/horizontal_product_cart.dart';
import 'package:flutter_donate_app/presentation/view/home/widgets/vertical_product_cart.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/product/product_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_categories_list_shimmer.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_horizontal_list_shimmer.dart';
import 'package:flutter_donate_app/presentation/widgets/text/section_header_widget.dart';
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
      child: Scaffold(
        backgroundColor: AppColors.cascadingWhite,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              HomeSliverAppBar(
                profileViewModel: _profileViewModel,
                addressViewModel: _addressViewModel,
              )
            ];
          },
          body: _buildBody(context),
        ),
      ),
    );
  }

  /// Body
  CustomScrollView _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: AutoPageSlider()),
        SliverToBoxAdapter(child: buildCategoriesList(context)),
        SliverToBoxAdapter(child: buildHorizontalList(context)),
        SliverToBoxAdapter(child: buildVerticalList(context)),
      ],
    );
  }

  /// Categories List
  Widget buildCategoriesList(BuildContext context) {
    switch (_productViewModel.getCategoriesResponse.status) {
      case Status.completed:
        return Column(
          children: [
            const SectionHeaderWidget(title: 'Kategoriler'),
            CategoriesListWidget(productViewModel: _productViewModel),
          ],
        );
      default:
        return const CustomCategoriesListShimmer();
    }
  }

  /// Horizontal Product List recently added productsrecently added products
  Widget buildHorizontalList(BuildContext context) {
    switch (_productViewModel.getProductsResponse.status) {
      case Status.completed:
        return Column(
          children: [
            const SectionHeaderWidget(title: 'Son Eklenenler'),
            SizedBox(
              height: context.dynamicHeight(.42),
              child: ListView.separated(
                itemCount: _productViewModel.getProductsResponse.data.products?.length ?? 0,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => context.sizedBoxWidthMedium,
                padding: context.paddings.horizontalMedium + context.paddings.verticalMedium,
                itemBuilder: (context, index) {
                  var product = _productViewModel.getProductsResponse.data.products![index];
                  return SizedBox(
                    width: context.dynamicWidth(.65),
                    child: VerticalProductCard(
                      product: product,
                      productType: _productViewModel.getProductTypeById(id: product.typeId!),
                      productStatus: _productViewModel.getProductStatusById(id: product.statusId!),
                      productCategory: _productViewModel.getProductCategoryById(id: product.categoryId!),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      default:
        return const CustomHorizontalListShimmer();
    }
  }

  /// Vertical Product List recently products nearby
  Widget buildVerticalList(BuildContext context) {
    return Column(
      children: [
        const SectionHeaderWidget(title: 'Yakınlardakiler'),
        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          padding: context.paddings.allMedium,
          separatorBuilder: (context, index) => context.sizedBoxHeightMedium,
          itemBuilder: (context, index) {
            return SizedBox(
              height: context.dynamicHeight(.17),
              child: const HorizontalProductCart(),
            );
          },
        ),
      ],
    );
  }
}
