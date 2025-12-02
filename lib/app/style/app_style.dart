import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color? color;

  const AppStyle._({
    required this.fontSize,
    required this.fontWeight,
    required this.fontStyle,
    this.color,
  });

  /// --- BASE SIZES ---
  static AppStyle get s12 => const AppStyle._(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static AppStyle get s14 => const AppStyle._(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static AppStyle get s16 => const AppStyle._(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static AppStyle get s18 => const AppStyle._(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static AppStyle get s20 => const AppStyle._(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  /// --- WEIGHTS ---
  AppStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  AppStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  AppStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  AppStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  /// --- STYLE ---
  AppStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// --- COLOR ---
  AppStyle c(Color color) => copyWith(color: color);

  /// --- Convert to TextStyle using GoogleFonts ---
  TextStyle get text {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
    );
  }

  /// --- CopyWith ---
  AppStyle copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color,
  }) {
    return AppStyle._(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      color: color ?? this.color,
    );
  }
}
