import 'package:flutter/material.dart';

abstract class AppStyle {
  static const String cairo = 'cairo';

  static const font13Bold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold, // w700
  );
  static const font13SemiBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
  static const font13Medium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const font13Regular = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const font20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold, // w700
  );
  static const font20SemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const font20Medium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const font20Regular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}
