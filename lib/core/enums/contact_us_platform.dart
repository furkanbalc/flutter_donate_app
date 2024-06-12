import 'package:flutter_donate_app/core/constants/app_constants.dart';

enum ContactUsPlatform {
  instagram('Instagram', AppConstants.openInstagram),
  whatsapp('WhatsApp', AppConstants.openWhatsapp),
  linkedin('LinkedIn', AppConstants.openLinkedin),
  github('GitHub', AppConstants.openGithub),
  phoneCall('Ara', AppConstants.openPhoneCall),
  ;

  final String platform;
  final String url;

  const ContactUsPlatform(this.platform, this.url);
}
