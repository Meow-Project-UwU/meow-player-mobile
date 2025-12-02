import 'package:flutter/material.dart';

import '../../app/color/color.dart';
import '../../app/style/app_style.dart';

class FancyTextField extends StatelessWidget {
  final String? labelText;

  FancyTextField({super.key, this.labelText});

  final focusScope = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusScope,
      onTapOutside: (event) {
        focusScope.unfocus();
      },
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: AppColors.babyPink.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Enter text',
        hintStyle: AppStyle.s14.w400
            .c(AppColors.textDark.withOpacity(0.6))
            .text,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
      ),
      style: AppStyle.s16.w500.c(AppColors.textDark).text,
    );
  }
}
