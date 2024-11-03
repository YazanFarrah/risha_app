import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final String? fontFamily;
  final TextOverflow? overflow;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final TextDirection? textDirection;
  final String? toolTipText;
  // Flags for specific TextTheme styles
  final bool? isDisplaySmall;
  final bool? isDisplayLarge;
  final bool? isHeadlineMedium;
  final bool? isHeadlineLarge;
  final bool isLocalize;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.fontFamily,
    this.overflow,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationThickness,
    this.decorationStyle,
    this.textDirection,
    this.toolTipText,
    this.isDisplaySmall = false,
    this.isDisplayLarge = false,
    this.isHeadlineMedium = false,
    this.isHeadlineLarge = false,
    this.isLocalize = true,
  });

  TextStyle _buildTextStyle(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle baseStyle = isDisplaySmall == true
        ? textTheme.displaySmall ?? TextStyle()
        : isDisplayLarge == true
            ? textTheme.displayLarge ?? TextStyle()
            : isHeadlineMedium == true
                ? textTheme.headlineMedium ?? TextStyle()
                : isHeadlineLarge == true
                    ? textTheme.headlineLarge ?? TextStyle()
                    : textTheme.displayMedium ?? TextStyle();

    return baseStyle.copyWith(
      fontSize: fontSize?.sp ?? baseStyle.fontSize?.sp,
      fontWeight: fontWeight ?? baseStyle.fontWeight,
      color: color ?? baseStyle.color,
      letterSpacing: letterSpacing ?? 0,
      height: height?.sp ?? 0.0.sp,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: decorationColor ?? color,
      decorationThickness: decorationThickness ?? 1.5,
      decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipText ?? '',
      textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: AppLightColors.appBackgroundColor,
          ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        isLocalize ? text.tr() : text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines ?? 1,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: _buildTextStyle(context),
      ),
    );
  }
}
