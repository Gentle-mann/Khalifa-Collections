import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../utils/snackbar.dart';

class LaunchLinkProvider extends ChangeNotifier {
  void showSnackBar(context) {
    ShowSnackBar.showSnackBar(
        'Text us your order via WhatsApp @ 09033696162', context);
  }

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

  shareOrderToWhatsApp(String message, Function showSnackBar) async {
    final whatsappVal = await isWhatsAppInstalled();
    final businessWhatsappVal = await isBusWhatsAppInstalled();
    if (whatsappVal || businessWhatsappVal) {
      final link = WhatsAppUnilink(
        phoneNumber: '2349033696162',
        text: message,
      );

      await launchUrl(link.asUri());
    } else {
      showSnackBar;
    }
  }
}
