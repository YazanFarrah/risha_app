import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/account/presentation/widgets/circular_icon_widget.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final userController = Get.find<CurrentUserController>();

        return SliverAppBar(
          backgroundColor: const Color(0XFF7F64FF),
          floating: false,
          pinned: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            title: Padding(
              padding: UIConstants.horizontalPadding,
              child: Row(
                children: [
                  CircularIconWidget(
                    size: 40,
                    widget: const Icon(
                      Icons.person,
                    ),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextWidget(
                          text: "welcomeBack",
                          color: Theme.of(context).colorScheme.surface,
                          maxLines: 2,
                          textThemeStyle: TextThemeStyleEnum.displayLarge,
                        ),
                        if (userController.user.value?.name != null)
                          CustomTextWidget(
                            textThemeStyle: TextThemeStyleEnum.displaySmall,
                            text: userController.user.value!.name!,
                            color: Theme.of(context).colorScheme.surface,
                            maxLines: 2,
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    child: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onTap: () {
                      Get.toNamed(RoutePaths.notifications);
                    },
                  ),
                ],
              ),
            ),
            background: Container(
              color: const Color(0XFF7F64FF),
            ),
          ),
        );
      },
    );
  }
}
