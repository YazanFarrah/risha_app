import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/home/presentation/controllers/trendy_quizzes_controller.dart';
import 'package:risha_app/features/home/presentation/widgets/category_section_widget.dart';

class AllTrendyQuizzesScreen extends StatelessWidget {
  const AllTrendyQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trendyQuizzesController = Get.find<TrendyQuizzesController>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "chooseSection",
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding.copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: "chooseYourFavAndMostImportantSection",
              textThemeStyle: TextThemeStyleEnum.displaySmall,
              maxLines: 2,
              color: Get.theme.colorScheme.shadow,
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
                  itemCount: trendyQuizzesController.trendyQuizzes.length,
                  itemBuilder: (context, index) {
                    final trendyQuiz =
                        trendyQuizzesController.trendyQuizzes[index];
                    final category = CategoryModel(
                      id: trendyQuiz.id,
                      arTitle: trendyQuiz.arName,
                      enTitle: trendyQuiz.enName,
                      hexColor: trendyQuiz.colorCode,
                      icon: trendyQuiz.icon,
                    );
                    return CategorySectionWidget(
                      category: category,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
