import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/subscription_widget.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<CurrentUserController>();
    return SliverToBoxAdapter(
      child: Column(
        children: [
          if (userController.user.value?.isPremium == false)
            Padding(
              padding: UIConstants.horizontalPadding,
              child: const SubscriptionWidget(),
            ),
        ],
      ),
    );
  }
}
