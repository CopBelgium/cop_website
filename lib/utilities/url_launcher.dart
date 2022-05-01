import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl({required String url}) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    debugPrint(e.toString());
  }
}
