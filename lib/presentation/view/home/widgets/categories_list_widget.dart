import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/product/product_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_categories_list_shimmer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key, required this.productViewModel});

  final ProductViewModel productViewModel;

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.productViewModel.getCategoriesResponse.status) {
      case Status.completed:
        var data = widget.productViewModel.getCategoriesResponse.data.categories;
        return SizedBox(
          height: context.dynamicHeight(.12),
          child: AnimationLimiter(
            child: ListView.separated(
              padding: context.paddings.horizontalMedium1 + context.paddings.verticalLow3,
              itemCount: data?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Durations.extralong1,
                  child: SlideAnimation(
                    horizontalOffset: 100.0,
                    child: ScaleAnimation(
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: AppColors.transparentColor,
                        onTap: () {},
                        child: AnimatedContainer(
                          duration: Durations.extralong1,
                          child: Column(
                            children: [
                              CustomSvgWidget(
                                svg: getCategoryIcon(data![index].image!),
                                width: context.dynamicWidth(.14),
                                height: context.dynamicWidth(.14),
                              ),
                              context.sizedBoxHeightMin,
                              Text(
                                data[index].name!,
                                style: context.textStyles.bodySmall.copyWith(color: AppColors.verifiedBlack),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => context.sizedBoxWidthMedium2,
            ),
          ),
        );

      default:
        return const CustomCategoriesListShimmer();
    }
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
