import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:risha_app/core/services/file_picker_service.dart';

class AuthAvatarPicker extends StatelessWidget {
  AuthAvatarPicker({super.key});
  
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final avatarUrl = _authController.avatarUrl.value;

      return GestureDetector(
        onTap: () async {
          if (avatarUrl == null) {
            final selectedImage = await FilesPickerService.pickImage(context);
            if (selectedImage != null) {
              _authController.updateAvatarUrl(selectedImage);
            }
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: avatarUrl != null
                  ? ClipOval(
                      child: Image.file(
                        File(avatarUrl),
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
                onTap: avatarUrl != null
                    ? () {
                        _authController.updateAvatarUrl(null);
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: avatarUrl != null
                        ? SharedColors.redColor
                        : Theme.of(context).colorScheme.primary,
                  ),
                  width: 27.w,
                  height: 27.w,
                  child: Icon(
                    avatarUrl != null ? CupertinoIcons.delete_solid : Icons.add,
                    color: Colors.white,
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
