import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';
import 'package:flutter_donate_app/core/enums/app_svg.dart';
import 'package:flutter_donate_app/core/extensions/context_borders.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_size.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/extensions/context_text_style.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bize Ulaşın'),
      body: Padding(
        padding: context.paddings.allMedium,
        child: Column(
          children: [
            _buildContactPlatform(context: context, icon: AppSvg.instagram.toSvg, label: 'Instagram'),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(context: context, icon: AppSvg.whatsapp.toSvg, label: 'WhatsApp'),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(context: context, icon: AppSvg.linkedin.toSvg, label: 'LinkedIn'),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(context: context, icon: AppSvg.github.toSvg, label: 'GitHub'),
            context.sizedBoxHeightMedium,
            _buildContactPlatform(context: context, icon: AppSvg.phone.toSvg, label: 'Telefon'),
          ],
        ),
      ),
    );
  }

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
            CustomSvgWidget(svg: icon, height: AppSizes.custom.value),
            context.sizedBoxWidthMedium,
            Text(label, style: context.textStyles.titleLarge),
          ],
        ),
      ),
    );
  }
}
