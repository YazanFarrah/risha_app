import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TranslationWidget extends StatelessWidget {
  const TranslationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.wait([
          Get.updateLocale(
            context.locale.languageCode == 'en' ? Locale('ar') : Locale('en'),
          ),
          context.setLocale(
            context.locale.languageCode == 'en' ? Locale('ar') : Locale('en'),
          ),
        ]);
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: CustomTextWidget(
          text: context.locale.languageCode == "en" ? "عربي" : "EN",
          color: Colors.white,
          isLocalize: false,
        ),
      ),
    );
  }
}
