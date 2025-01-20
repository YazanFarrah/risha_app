import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/utils/color_utils.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/quiz/enums/available_quizzes_filter_enum.dart';
import 'package:risha_app/features/quiz/enums/quiz_status_enum.dart';
import 'package:risha_app/features/quiz/presentation/controllers/section_available_quizzes_controller.dart';
import 'package:risha_app/features/quiz/presentation/widgets/quiz_info_widget.dart';
import 'package:risha_app/features/quiz/presentation/widgets/quizzes_section_status_filter_widget.dart';

class SectionAvailableQuizzesScreen extends StatelessWidget {
  final CategoryModel category;
  const SectionAvailableQuizzesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final timeFilters = [
      {'label': 'all', 'value': AvailableQuizzesFilterEnum.all},
      {'label': 'leftOnly', 'value': AvailableQuizzesFilterEnum.left},
      {'label': 'incompleted', 'value': AvailableQuizzesFilterEnum.completed},
    ];

    final sectionController = Get.find<SectionAvailableQuizzesController>();
    return Obx(
      () {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: UIConstants.horizontalPadding,
              child: Row(
                spacing: 8.w,
                children: [
                  const Icon(CupertinoIcons.question_circle_fill),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${"availableQuizzesIn".tr(context: context)} ",
                          style: Get.textTheme.displayMedium,
                        ),
                        TextSpan(
                          text: Get.locale?.languageCode == "ar"
                              ? (category.arTitle ?? "")
                              : (category.enTitle ?? ""),
                          style: Get.textTheme.displayMedium!.copyWith(
                            color: ColorUtils.hexToColor(
                              category.hexColor ?? "",
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ":",
                          style: Get.textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            SingleChildScrollView(
              padding: UIConstants.horizontalPadding,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10.w,
                children: timeFilters.map((filter) {
                  final isSelected =
                      sectionController.filter.value == filter['value'];
                  return GestureDetector(
                    onTap: () => sectionController.changeStatusFilter(
                      filter['value'] as AvailableQuizzesFilterEnum,
                    ),
                    child: QuizzesSectionStatusFilterWidget(
                      isSelected: isSelected,
                      text: filter['label'] as String,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 34.h,
            ),
            Expanded(
              child: ListView.separated(
                padding: UIConstants.horizontalPadding.copyWith(bottom: 30.h),
                itemBuilder: (context, index) {
                  return QuizInfoWidget(
                    quizStatusEnum: index == 1
                        ? QuizStatusEnum.newQuiz
                        : index == 2
                            ? QuizStatusEnum.incompleted
                            : QuizStatusEnum.completed,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: 8,
              ),
            ),
           
          ],
        );
      },
    );
  }
}
