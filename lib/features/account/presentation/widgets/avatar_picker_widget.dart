import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/services/file_picker_service.dart';
import 'package:risha_app/core/widgets/custom_cached_image.dart';
import 'package:risha_app/features/account/presentation/controllers/edit_account_controller.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class AvatarPickerWidget extends StatelessWidget {
  AvatarPickerWidget({super.key});

  final _userController = Get.find<CurrentUserController>();
  final _editAccountController = Get.find<EditAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final avatarUrl = _userController.user.value?.avatarUrl;
      final tempAvatarPath = _editAccountController.tempAvatarPath.value;

      return GestureDetector(
        onTap: () async {
          final selectedImage = await FilesPickerService.pickImage(context);
          if (selectedImage != null) {
            _editAccountController.updateTempAvatarPath(selectedImage);
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              child: tempAvatarPath != null
                  ? ClipOval(
                      child: Image.file(
                        File(tempAvatarPath),
                        fit: BoxFit.cover,
                      ),
                    )
                  : avatarUrl != null
                      ? ClipOval(
                          child: CustomCachedImage(
                            image: avatarUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SvgPicture.asset(
                          AssetPaths.personOutline,
                          width: 40.w,
                          fit: BoxFit.scaleDown,
                        ),
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: tempAvatarPath != null
                    ? () => _editAccountController.updateTempAvatarPath(null)
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: tempAvatarPath != null
                        ? SharedColors.redColor
                        : Get.theme.colorScheme.primary,
                  ),
                  width: 27.w,
                  height: 27.w,
                  child: Icon(
                    tempAvatarPath != null
                        ? CupertinoIcons.delete
                        : avatarUrl != null
                            ? CupertinoIcons.pencil
                            : Icons.add,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
