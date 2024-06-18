import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<void> openUrl(ContactUsPlatform platform) async {
    if (await canLaunchUrl(Uri.parse(platform.url))) {
      await launchUrl(Uri.parse(platform.url));
    } else {
      Utils.errorSnackBar(
        context: context,
        message: '${platform.platform} kanalına yönlendirme yapılamadı',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bize Ulaşın'),
      body: Padding(
        padding: context.paddings.allMedium,
        child: Column(
          children: [
            _developerInfo(),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(
              context: context,
              icon: AppSvg.instagram.toSvg,
              label: ContactUsPlatform.instagram.platform,
              onTap: () {
                openUrl(ContactUsPlatform.instagram);
              },
            ),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(
              context: context,
              icon: AppSvg.whatsapp.toSvg,
              label: ContactUsPlatform.whatsapp.platform,
              onTap: () {
                openUrl(ContactUsPlatform.whatsapp);
              },
            ),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(
              context: context,
              icon: AppSvg.linkedin.toSvg,
              label: ContactUsPlatform.linkedin.platform,
              onTap: () {
                openUrl(ContactUsPlatform.linkedin);
              },
            ),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(
              context: context,
              icon: AppSvg.github.toSvg,
              label: ContactUsPlatform.github.platform,
              onTap: () {
                openUrl(ContactUsPlatform.github);
              },
            ),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(
              context: context,
              icon: AppSvg.phone.toSvg,
              label: ContactUsPlatform.phoneCall.platform,
              onTap: () {
                openUrl(ContactUsPlatform.phoneCall);
              },
            ),
          ],
        ),
      ),
    );
  }
  /// Developer Info
  Widget _developerInfo() {
    return Container(
      width: context.dynamicWidth(),
      padding: context.paddings.allLow,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: context.borders.circularBorderRadiusMedium,
      ),
      child: Text('Geliştirici: Furkan Balcı\n(Flutter Developer)',
          textAlign: TextAlign.center, style: context.textStyles.labelSmall),
    );
  }

  /// Platform Card
  Widget _buildContactPlatform({
    required BuildContext context,
    required String icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: context.paddings.allLow,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: context.borders.circularBorderRadiusMedium,
        ),
        child: Row(
          children: [
            CustomSvgWidget(svg: icon, height: AppSizes.high3.value),
            context.sizedBoxWidthMedium,
            Text(label, style: context.textStyles.titleLarge),
          ],
        ),
      ),
    );
  }
}
