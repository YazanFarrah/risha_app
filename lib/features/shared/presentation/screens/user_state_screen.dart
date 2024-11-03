import 'dart:developer';
import 'package:flutter_svg/svg.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/widgets/custom_text_widget.dart';

class UserState extends StatefulWidget {
  const UserState({super.key});

  @override
  State<UserState> createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  final _localStorage = Get.find<HiveServices>();

  @override
  void initState() {
    checkUserState();
    super.initState();
  }

  void checkUserState() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchData();
    });
  }

  Future<void> fetchData() async {
    if (_localStorage.getToken == null) {
      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed(RoutePaths.auth);
      return;
    }
    await Future.wait([
      Get.find<CurrentUserController>().getUser(),
    ]).then((_) {
      Get.offAllNamed(RoutePaths.navScreen);
    }).onError((_, stackTrace) {
      log(stackTrace.toString());
      Get.offAllNamed(RoutePaths.auth);
      ToastUtils.showError(
        "errorOccuredPleaseCloseTheAppAndTryAgain".tr(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              child: SvgPicture.asset(AssetPaths.appLogo, width: 145.w)
                  .animate()
                  .shimmer(duration: 900.ms),
            ),
            SizedBox(height: 24.h),
            RepaintBoundary(
              child: CustomTextWidget(
                text: "ريشة",
                textAlign: TextAlign.center,
                color: Colors.white,
                isDisplayLarge: true,
                isLocalize: false,
                fontSize: 24,
              ).animate().shimmer(duration: 900.ms),
            ),
            RepaintBoundary(
              child: CustomTextWidget(
                text: "المعرفة",
                textAlign: TextAlign.center,
                color: SharedColors.goldColor,
                isDisplayLarge: true,
                isLocalize: false,
                fontSize: 24,
              ).animate().shimmer(duration: 900.ms),
            ),
            const SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
