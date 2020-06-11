import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> parseJsonFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then(jsonDecode);
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url ?? '')) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}