
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CustomIntlPhoneNumberInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomIntlPhoneNumberInput({
    super.key,
    required this.controller,
     this.validator,
  });

  @override
  State<CustomIntlPhoneNumberInput> createState() => _CustomIntlPhoneNumberInputState();
}

class _CustomIntlPhoneNumberInputState extends State<CustomIntlPhoneNumberInput> {
  String initialCountry = 'TR';

  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.form_fields_phone_number.tr(),
          textAlign: TextAlign.left,
          style: context.textStyles.titleSmall.copyWith(color: AppColors.blackPrimary, fontWeight: FontWeight.w600),
        ),
        context.sizedBoxHeightMin,
        InternationalPhoneNumberInput(
          locale: 'TR',
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            trailingSpace: false,
          ),
          formatInput: true,
          maxLength: 13,
          autoValidateMode: AutovalidateMode.disabled,
          autofillHints: const [AutofillHints.telephoneNumber],
          initialValue: number,
          textAlignVertical: TextAlignVertical.center,
          inputDecoration: const InputDecoration(
            hintText: '555 555 55 55',
            contentPadding: EdgeInsets.only(bottom: 14, top: 14, left: 8),
            border: InputBorder.none,
          ),
          textFieldController: widget.controller,
          keyboardAction: TextInputAction.done,
          spaceBetweenSelectorAndTextField: MediaQuery.sizeOf(context).width / 51.75,
          keyboardType: TextInputType.phone,
          searchBoxDecoration: InputDecoration(
            fillColor: AppColors.greyLight.withOpacity(.1),
            hintText: 'Ara...',
            contentPadding: context.paddings.onlyLeftMedium + context.paddings.verticalMedium,
            suffixIcon: const Icon(AppIcons.kSearchIcon),

          ),
          onInputChanged: (PhoneNumber value) {},
        ),
      ],
    );
  }
}
