import 'package:url_launcher/url_launcher.dart';

Future<void> launchUniversalLink(String url) async {
  if (await canLaunch(url)) {
    final bool nativeAppLaunch =
    await launch(url, forceSafariVC: false, universalLinksOnly: true);
    if (!nativeAppLaunch) {
      await launch(url, forceSafariVC: false);
    }
  }
}