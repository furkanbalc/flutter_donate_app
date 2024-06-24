import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';

class CustomCheckBoxListTile extends FormField<bool> {
  CustomCheckBoxListTile({
    required String title,
    super.key,
  }) : super(
          initialValue: false,
          validator: (bool? value) => value == false ? '' : null,
          builder: (FormFieldState<bool> state) {
            return Row(
              children: [
                if (state.hasError) const Icon(Icons.error, color: Colors.red),
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: AppColors
                          .transparentColor, // Checkbox'ın dış çerçeve rengini şeffaf yapar
                      splashColor: AppColors
                          .transparentColor, // Splash rengini şeffaf yapar
                      highlightColor: AppColors
                          .transparentColor, // Highlight rengini şeffaf yapar
                      hoverColor: AppColors
                          .transparentColor, // Hover rengini şeffaf yapar
                    ),
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(title, style: const TextStyle(fontSize: 14)),
                      value: state.value ?? false,
                      onChanged: state.didChange,
                    ),
                  ),
                ),
              ],
            );
          },
        );
}
