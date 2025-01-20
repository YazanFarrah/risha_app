import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/utils/color_utils.dart';
import 'package:risha_app/core/widgets/custom_image.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/account/presentation/controllers/category_controller.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    log(category.isFavorite.toString());

    return Obx(() {
      bool isSelected = categoryController.selectedCategories
          .any((selected) => selected.id == category.id);

      return GestureDetector(
        onTap: () {
          categoryController.toggleCategorySelection(category);
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
                border: isSelected
                    ? Border.all(
                        color: Get.theme.colorScheme.primary,
                        width: 1,
                      )
                    : Border.all(color: Colors.transparent),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImage(image: category.icon ?? ""),
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
            if (isSelected)
              Positioned(
                bottom: -10.h,
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 12.r,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
