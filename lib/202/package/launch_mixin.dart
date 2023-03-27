import 'package:url_launcher/url_launcher.dart';

import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  launchUrl(String url) async {
    if (await canLaunchUrl(launchUrl(url))) {
      await launchUrl(url);
    }
  }
}
