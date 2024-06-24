import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';

class ProfileInfoTextField extends StatelessWidget {
  const ProfileInfoTextField({
    super.key,
    this.controller,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.prefixIcon,
    this.readOnly,
    this.labelText,
    this.profileViewModel,
    this.fillColor,
    this.onChanged,
    this.minLines,
    this.maxLines,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool? readOnly;
  final String? labelText;
  final ProfileViewModel? profileViewModel;
  final Color? fillColor;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      validator: validator,
      labelText: labelText,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, size: AppSizes.medium2.value)
          : null,
      isTitle: true,
      readOnly: readOnly ?? false,
      fillColor: fillColor ?? AppColors.whiteColor,
      keyboardType: keyboardType,
      border: OutlineInputBorder(
        borderRadius: context.borders.circularBorderRadiusMedium,
        borderSide: const BorderSide(color: AppColors.steel),
      ),
      onTap: onTap,
      onChanged: onChanged,
      unFocus: true,
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
