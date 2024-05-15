import 'package:flutter/material.dart';

class CustomCheckBoxListTile extends FormField<bool> {
  CustomCheckBoxListTile({
    required String title,
    super.key,
  }) : super(
          initialValue: false,
          validator: (bool? value) => value == false ? null : '',
          builder: (FormFieldState<bool> state) {
            return Row(
              children: [
                if (state.hasError) const Icon(Icons.error, color: Colors.red),
                Expanded(
                  child: CheckboxListTile(

                    contentPadding: EdgeInsets.zero,
                    title: Text(title, style: const TextStyle(fontSize: 14)),
                    value: state.value ?? false,
                    onChanged: state.didChange,
                  ),
                ),
              ],
            );
          },
        );
}
