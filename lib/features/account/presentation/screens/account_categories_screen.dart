import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/loader.dart';
import 'package:risha_app/features/account/presentation/widgets/category_widget.dart';
import 'package:risha_app/features/account/presentation/controllers/category_controller.dart';

class AccountCategoriesScreen extends StatelessWidget {
  const AccountCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "favCategories",
      ),
      bottomNavigationBar: Obx(
        () {
          if (categoryController.isLoading.value) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: CustomButton(
              onPressed: () {},
              child:  CustomTextWidget(
                text: "saveFav",
                color: Get.theme.colorScheme.onSurface,
              ),
            ),
          );
        },
      ),
      body: Obx(() {
        if (categoryController.isLoading.value == true) {
          return Center(
              child: LoadingFadingCircle(
            color: Get.theme.colorScheme.primary,
          ));
        }

        return SingleChildScrollView(
          padding: UIConstants.bodyPadding.copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: "chooseFavoriteCategories",
                textThemeStyle: TextThemeStyleEnum.displaySmall,
                maxLines: 2,
              ),
              const CustomTextWidget(
                text: "helpUsChoose",
                textThemeStyle: TextThemeStyleEnum.displaySmall,
                maxLines: 2,
              ),
              SizedBox(height: 50.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;

                  if (constraints.maxWidth >= 1200.w) {
                    crossAxisCount = 6;
                  } else if (constraints.maxWidth >= 800.w) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth >= 600.w) {
                    crossAxisCount = 3;
                  } else {
                    crossAxisCount = 3;
                  }

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: .85,
                    ),
                    itemCount: categoryController.allCategories.length,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        category: categoryController.allCategories[index],
                      );
                    },
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
