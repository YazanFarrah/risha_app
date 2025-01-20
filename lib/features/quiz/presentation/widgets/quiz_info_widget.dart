import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/quiz/enums/quiz_status_enum.dart';

class QuizInfoWidget extends StatelessWidget {
  final QuizStatusEnum quizStatusEnum;
  const QuizInfoWidget({super.key, required this.quizStatusEnum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Get.theme.colorScheme.onSurface,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 20.w,
                  width: 20.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getStatusColor,
                  ),
                  child: _getStatusIcon,
                ),
                SizedBox(width: 15.w),
                SvgPicture.asset(
                  AssetPaths.appLogo,
                  height: 15.w,
                  width: 15.w,
                ),
                SizedBox(width: 7.w),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "العلوم",
                        style: Get.theme.textTheme.displayMedium!.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: " - ",
                        style: Get.theme.textTheme.displayMedium,
                      ),
                      TextSpan(
                        text: 'الاختبار',
                        style: Get.theme.textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          SizedBox(height: 8.5.w),
          const Divider(
            color: Color(0XFFF1F1F1),
            height: 0,
          ),
          SizedBox(height: 10.w),
          const QuizStats(
            value: "10",
            svgAsset: AssetPaths.diamond,
            title: "نقاط الاختبار",
          ),
          const QuizStats(
            value: "8",
            svgAsset: AssetPaths.diamond,
            title: "عدد الاسئله",
          ),
          const QuizStats(
              value: "12510", svgAsset: AssetPaths.people, title: "المشاركين"),
        ],
      ),
    );
  }

  Color get _getStatusColor {
    switch (quizStatusEnum) {
      case QuizStatusEnum.newQuiz:
        return SharedColors.inActiveSwitchColor;
      case QuizStatusEnum.incompleted:
        return SharedColors.goldColor;
      case QuizStatusEnum.completed:
        return SharedColors.successColor;
    }
  }

  Widget? get _getStatusIcon {
    switch (quizStatusEnum) {
      case QuizStatusEnum.newQuiz:
        return null; // No icon for new quizzes
      case QuizStatusEnum.incompleted:
        return Icon(
          Icons.info_outline,
          // TODO: Use svg instead of icon here for the info
          color: Colors.white,
          size: 15.r,
        ); // Info icon for incomplete quizzes
      case QuizStatusEnum.completed:
        return Icon(
          Icons.check,
          color: Colors.white,
          size: 15.r,
        ); // Check icon for completed quizzes
    }
  }
}

class QuizStats extends StatelessWidget {
  final String value;
  final String title;
  final String svgAsset;
  const QuizStats({
    super.key,
    required this.value,
    required this.title,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.5.h),
      child: Row(
        spacing: 5.w,
        children: [
          SvgPicture.asset(svgAsset),
          CustomTextWidget(
            text: title,
            textThemeStyle: TextThemeStyleEnum.displaySmall,
          ),
          CustomTextWidget(
            text: value,
            textThemeStyle: TextThemeStyleEnum.displaySmall,
            color: Get.theme.colorScheme.inverseSurface,
          ),
        ],
      ),
    );
  }
}
