import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/subscription_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/favorite_categories_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/trending_quizzes_categories_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/trending_quizzes_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/view_all_with_title_widget.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<CurrentUserController>();
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userController.user.value?.isPremium == false)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 19.w),
              child: SubscriptionWidget(height: 66.h),
            ),
          Padding(
            padding: UIConstants.horizontalPadding,
            child: ViewAllWithTitleWidget(
              title: "BLAH BLAH",
              onTap: () {},
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 47.h,
            child: ListView.separated(
              padding: UIConstants.horizontalPadding,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const TrendingQuizzesCategoriesWidget(
                  color: Colors.green,
                  icon: Icons.cases_outlined,
                  title: "اعمال",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.w);
              },
              itemCount: 4,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: UIConstants.horizontalPadding,
            child: ViewAllWithTitleWidget(
              title: "BLAH BLAH",
              onTap: () {},
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 115.h,
            child: ListView.separated(
              padding: UIConstants.horizontalPadding,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const TrendingQuizzesWidget(
                  color: Colors.red,
                  icon: Icons.cases_outlined,
                  title: "علوم-115",
                  points: "مجموع النقاط 18",
                  subs: "عدد المشاركين 132",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.w);
              },
              itemCount: 4,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: UIConstants.horizontalPadding,
            child: const FavoriteCategoriesWidget(),
          ),
        ],
      ),
    );
  }
}
