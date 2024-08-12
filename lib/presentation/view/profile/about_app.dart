import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/app_png.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutApp extends ConsumerStatefulWidget {
  const AboutApp({super.key});

  @override
  ConsumerState createState() => _AboutAppState();
}

class _AboutAppState extends ConsumerState<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Uygulama Hakkında'),
      body: Padding(
        padding: context.paddings.allMedium1,
        child: ListView(
          children: [
            Container(
              width: context.dynamicWidth(),
              padding: context.paddings.allMedium1,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: context.borders.circularBorderRadiusMedium,
              ),
              child: Column(
                children: [
                  CustomImageWidget(
                    image: AppPng.appLogo.toPng,
                    color: AppColors.verifiedBlack,
                    height: context.dynamicHeight(.2),
                  ),
                  Text(
                    'v1.0.0',
                    textAlign: TextAlign.center,
                    style: context.textStyles.titleSmall,
                  ),
                ],
              ),
            ),
            context.sizedBoxHeightMedium1,
            Text('Bende Fazla Nedir?',
                style: context.textStyles.titleLarge
                    .copyWith(fontWeight: FontWeight.w800)),
            context.sizedBoxHeightLow2,
            const Text(
                "'Bende Fazla', kullanıcıların elinde fazla bulunan, kullanmadıkları ama kullanılabilir durumda olan gıda, mobilya, giysi, kitap, oyuncak gibi nesneleri ihtiyaç sahiplerine bağışlamalarını sağlayan bir mobil uygulamadır. Bu sayede israfı önleyerek, ihtiyaç sahiplerine yardımcı olmayı amaçlıyoruz."),
            context.sizedBoxHeightMedium1,
            Text('Ne İçin Var?',
                style: context.textStyles.titleLarge
                    .copyWith(fontWeight: FontWeight.w800)),
            context.sizedBoxHeightLow2,
            const Text(
                '"Bende Fazla" uygulaması, israfı önlemek ve ihtiyaç sahiplerine destek olmak için oluşturulmuştur. Fazladan alınan ya da kullanılmayan eşyalarınızı başkalarıyla paylaşarak, hem çevreye katkıda bulunabilir hem de toplumsal dayanışmayı artırabilirsiniz.'),
            context.sizedBoxHeightMedium1,
            Text('Uygulamanın Amacı',
                style: context.textStyles.titleLarge
                    .copyWith(fontWeight: FontWeight.w800)),
            context.sizedBoxHeightLow2,
            Text(
                'Uygulamamızın birinci ve asıl amacı, kullanıcıların fazladan aldığı veya elinde fazladan bulunan, kendisinin kullanmadığı ama başkasının eline geçtiğinde kullanılabilecek durumda olan her türlü nesneyi ihtiyaç sahiplerine bağışlamasını sağlamaktır. Ayrıca restoranlarda, marketlerde ve evlerde tüketilemeyen ama iyi durumda olan gıdaları da ihtiyaç sahiplerine ulaştırmak amaçlanmaktadır.'),
            context.sizedBoxHeightMedium1,
            Text('İkinci Aşama',
                style: context.textStyles.titleLarge
                    .copyWith(fontWeight: FontWeight.w800)),
            Text(
                'Uygulama yaygınlaştığında, işletmelerle anlaşarak fazla gıdaları gönüllü öğrenciler aracılığıyla toplayıp ihtiyaç sahiplerine ulaştırmayı hedefliyoruz. Ayrıca ürünlerin piyasa fiyatının altında bir değerle satılmasını sağlayarak, daha fazla insanın uygun fiyatlarla ihtiyaçlarını karşılamasını amaçlıyoruz.'),
            context.sizedBoxHeightMedium1,
          ],
        ),
      ),
    );
  }
}
