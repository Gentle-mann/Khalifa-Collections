import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../utils/snackbar.dart';

class LaunchLinkProvider {
  Future<bool> isWhatsAppInstalled() async {
    final isWhatsappInstalled =
        await WhatsappShare.isInstalled(package: Package.whatsapp);
    if (isWhatsappInstalled != null) {
      return isWhatsappInstalled;
    } else {
      return false;
    }
  }

  Future<bool> isBusWhatsAppInstalled() async {
    final isBusinessWhatsappInstalled =
        await WhatsappShare.isInstalled(package: Package.businessWhatsapp);
    if (isBusinessWhatsappInstalled != null) {
      return isBusinessWhatsappInstalled;
    } else {
      return false;
    }
  }
}
