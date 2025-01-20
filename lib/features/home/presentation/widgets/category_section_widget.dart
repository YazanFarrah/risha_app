import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/utils/color_utils.dart';
import 'package:risha_app/core/widgets/custom_image.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/quiz/presentation/controllers/section_available_quizzes_controller.dart';
import 'package:risha_app/features/quiz/presentation/screens/section_available_quizzes_screen.dart';

class CategorySectionWidget extends StatelessWidget {
  final CategoryModel category;

  const CategorySectionWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.put(SectionAvailableQuizzesController());
        showModalBottomSheet(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 0.9.sh,
            maxHeight: 0.9.sh
          ),
          useSafeArea: true,
          isScrollControlled: true,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return SectionAvailableQuizzesScreen(category: category);
          },
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.onSurface,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(
                  image: category.icon ?? "",
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 20.h),
                CustomTextWidget(
                  text: Get.locale?.languageCode == "ar"
                      ? (category.arTitle ?? "")
                      : (category.enTitle ?? ""),
                  color: ColorUtils.hexToColor(category.hexColor!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
