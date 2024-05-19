import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(color: Colors.black.withOpacity(.1)),
        const SpinKitCircle(color: AppColors.whiteColor),
        // Lottie.asset(
        //   AppLotties.loading.toLottie,
        //   height: MediaQuery.of(context).size.width / MediaQuery.of(context).devicePixelRatio,
        //   repeat: true,
        //   reverse: true,
        // ),
      ],
    );
  }
}
