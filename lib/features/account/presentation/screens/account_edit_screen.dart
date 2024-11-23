import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';
import 'package:risha_app/features/account/presentation/widgets/account_gender_selection.dart';
import 'package:risha_app/features/account/presentation/widgets/avatar_picker_widget.dart';
import 'package:risha_app/features/shared/presentation/controllers/current_user_controller.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key});

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  final _userController = Get.find<CurrentUserController>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final ValueNotifier<String> _selectedGender = ValueNotifier<String>("Male");

  @override
  void initState() {
    _fullNameController.text = _userController.user.value?.name ?? "";
    _emailController.text = _userController.user.value?.email ?? "";
    _usernameController.text = _userController.user.value?.username ?? "";
    _selectedGender.value = _userController.user.value?.gender?.name ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _userController.updateTempAvatarPath(null);
    _fullNameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "editAcc",
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding,
        child: Column(
          children: [
            Center(child: AvatarPickerWidget()),
            SizedBox(height: 14.h),
            const CustomTextWidget(
              text: "تغيير الصورة",
              isDisplaySmall: true,
            ),
            SizedBox(height: 20.h),
            TextWithTextField(
              text: "fullName",
              hintText: "fullName",
              controller: _fullNameController,
            ),
            TextWithTextField(
              text: "email",
              hintText: "email",
              controller: _emailController,
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: _userController.user.value?.isEmailVerified == true
                          ? "emailVerified"
                          : "emailNotVerified",
                      color: _userController.user.value?.isEmailVerified == true
                          ? SharedColors.successColor
                          : SharedColors.redColor,
                      isDisplaySmall: true,
                    ),
                  ],
                ),
              ),
            ),
            TextWithTextField(
              text: "username",
              hintText: "username",
              controller: _usernameController,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RoutePaths.accountResetPassword);
              },
              child: AbsorbPointer(
                absorbing: true,
                child: TextWithTextField(
                  text: "password",
                  controller: TextEditingController(text: "*********"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RoutePaths.accountResetPassword);
              },
              child: AbsorbPointer(
                absorbing: true,
                child: TextWithTextField(
                  text: "birthday",
                  controller: TextEditingController(text: "*********"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RoutePaths.accountResetPassword);
              },
              child: AbsorbPointer(
                absorbing: true,
                child: TextWithTextField(
                  text: "gender",
                  controller: TextEditingController(text: "*********"),
                ),
              ),
            ),
            GenderSelectionWidget(
              selectedGender: _selectedGender,
              onChanged: (value) {
                _selectedGender.value = value;
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
