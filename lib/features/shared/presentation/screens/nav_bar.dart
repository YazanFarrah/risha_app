import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/services/hive_services.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/features/account/presentation/screens/account_screen.dart';
import 'package:risha_app/features/shared/presentation/controllers/bottom_nav_bar_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final List<Widget> _screens = [
    Center(
      child: CustomButton(
        onPressed: () => Get.find<HiveServices>().clearPreferences(),
        text: "Clear local storage",
      ),
    ),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.find<CurrentUserController>();

    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: _screens,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: _buildBottomNavBar(
              context,
              controller,
              currentUserController,
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBar _buildBottomNavBar(
      BuildContext context,
      BottomNavController controller,
      CurrentUserController currentUserController) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.setIndex(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: _buildNavItemIcon(
            controller,
            context,
            index: 0,
            asset: AssetPaths.home,
            filledAsset: AssetPaths.homeFilled,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: _buildNavItemIcon(
            controller,
            context,
            index: 1,
            asset: AssetPaths.person,
            filledAsset: AssetPaths.personFilled,
          ),
          label: "",
        ),
      ],
    );
  }

  Widget _buildNavItemIcon(
    BottomNavController controller,
    BuildContext context, {
    required int index,
    required String asset,
    required String filledAsset,
  }) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Image.asset(
        width: 29.w,
        controller.currentIndex.value == index ? filledAsset : asset,
        color: controller.currentIndex.value == index
            ? Theme.of(context).primaryColor
            : SharedColors.greyTextColor,
        key: ValueKey<int>(controller.currentIndex.value),
      ),
    );
  }
}
