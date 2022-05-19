import 'package:flutter/material.dart';
import 'package:qr_reader/domain/entities/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  if (scan.tipo=='web') {
      if (!await launchUrl(Uri.parse(scan.valor))) throw 'Could not launch ${scan.valor} ';
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}