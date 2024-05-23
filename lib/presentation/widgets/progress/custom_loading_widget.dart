import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        const CupertinoActivityIndicator()
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
