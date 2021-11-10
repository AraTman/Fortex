// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

class AppConstant {
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "lib/assets/lang";

  static const SUPPORTED_LOCALE = [
    AppConstant.TR_LOCALE,
    AppConstant.EN_LOCALE,
  ];
}