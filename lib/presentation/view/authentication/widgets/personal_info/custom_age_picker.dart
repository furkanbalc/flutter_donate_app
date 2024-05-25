import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';

class CustomAgeSelector extends StatefulWidget {
  const CustomAgeSelector({super.key, required this.personalInfoViewModel});

  final PersonalInfoViewModel personalInfoViewModel;

  @override
  State<CustomAgeSelector> createState() => _CustomAgeSelectorState();
}

class _CustomAgeSelectorState extends State<CustomAgeSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.6),
      child: CupertinoPicker.builder(
        squeeze: 1.5,
        itemExtent: 80,
        onSelectedItemChanged: (value) => widget.personalInfoViewModel.age,
        childCount: 73,
        itemBuilder: (context, index) {
          var age = index + 18;
          return Center(
            child: Text(
              age.toString(),
              style: TextStyle(
                fontSize: widget.personalInfoViewModel.age == index + 18 ? 65 : 60,
                fontWeight: widget.personalInfoViewModel.age == index + 18 ? FontWeight.bold : FontWeight.w800,
                color: widget.personalInfoViewModel.age == index + 18 ? AppColors.electricViolet : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
