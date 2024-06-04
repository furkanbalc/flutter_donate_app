import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String desc;
  final String img;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.desc,
    required this.img,
  });
}

class OnBoardingItems {
  late final List<OnBoardingModel> onBoarditems;

  OnBoardingItems() {
    onBoarditems = [
      OnBoardingModel(
        img: AppPng.phone.toPng,
        title: LocaleKeys.on_board_title_1.tr(),
        subTitle: LocaleKeys.on_board_sub_title_1.tr(),
        desc: LocaleKeys.on_board_desc_1.tr(),
      ),
      OnBoardingModel(
        img: AppPng.phone.toPng,
        title: LocaleKeys.on_board_title_2.tr(),
        subTitle: LocaleKeys.on_board_sub_title_2.tr(),
        desc: LocaleKeys.on_board_desc_2.tr(),
      ),
      OnBoardingModel(
        img: AppPng.phone.toPng,
        title: LocaleKeys.on_board_title_3.tr(),
        subTitle: LocaleKeys.on_board_sub_title_3.tr(),
        desc: LocaleKeys.on_board_desc_3.tr(),
      ),
      OnBoardingModel(
        img: AppPng.phone.toPng,
        title: LocaleKeys.on_board_title_4.tr(),
        subTitle: LocaleKeys.on_board_sub_title_4.tr(),
        desc: LocaleKeys.on_board_desc_4.tr(),
      ),
    ];
  }
}
