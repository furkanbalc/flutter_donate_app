import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.autofillHints,
    this.textInputAction,
    this.obscureText,
    this.hintText,
    this.labelText,
    this.suffixOnPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.autoFocus,
    this.textAlign,
    this.maxLines,
    this.maxLenght,
    this.minLines,
    this.prefixIconColor,
    this.onTap,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.fillColor,
    this.contentPadding,
    this.unFocus,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final VoidCallback? suffixOnPressed;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Color? fillColor;
  final Iterable<String>? autofillHints;
  final bool? obscureText;
  final bool? readOnly;
  final String? labelText;
  final String? hintText;
  final bool? autoFocus;
  final bool? unFocus;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? minLines;
  final int? maxLenght;

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText ?? '',
          textAlign: TextAlign.left,
          style: context.textStyles.titleSmall.copyWith(color: AppColors.blackPrimary, fontWeight: FontWeight.w600),
        ),
        context.sizedBoxHeightMin,
        TextFormField(
          controller: controller,
         onTapOutside: (event) => (unFocus ?? false) ? currentFocus.unfocus() : null,
          onChanged: onChanged,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          maxLength: maxLenght,
          validator: validator,
          onTap: onTap,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          textInputAction: textInputAction,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText ?? false,
          autofocus: autoFocus ?? false,
          readOnly: readOnly ?? false,
          style: context.textStyles.titleSmall.copyWith(color: AppColors.blackColor, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            contentPadding: contentPadding ?? context.paddings.onlyLeftMedium + context.paddings.verticalMedium,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: InkWell(
              highlightColor: AppColors.transparentColor,
              splashFactory: NoSplash.splashFactory,
              onTap: suffixOnPressed,
              child: Icon(suffixIcon, color: AppColors.verifiedBlack),
            ),

            // CustomIconButton(
            //   onPressed: suffixOnPressed,
            //   icon: suffixIcon,
            //   iconColor: AppColors.verifiedBlack,
            //   highlightColor: AppColors.transparentColor,
            // ),
          ),
        ),
      ],
    );
  }
}
