import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/enums/text_style_enum.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/loader.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';
import 'package:risha_app/features/account/presentation/controllers/edit_account_controller.dart';
import 'package:risha_app/features/account/presentation/screens/account_select_country.dart';
import 'package:risha_app/features/account/presentation/widgets/account_birthday_selection.dart';
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
  final _accountController = Get.find<EditAccountController>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _selectedGender = ValueNotifier<String>("Male");
  final _selectedBirthday = ValueNotifier<String?>(null);

  @override
  void initState() {
    _fullNameController.text = _userController.user.value?.name ?? "";
    _emailController.text = _userController.user.value?.email ?? "";
    _usernameController.text = _userController.user.value?.username ?? "";
    _selectedGender.value = _userController.user.value?.gender?.name ?? "";
    _selectedBirthday.value = _userController.user.value?.birthday ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _accountController.updateTempAvatarPath(null);
    _fullNameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _selectedBirthday.dispose();
    _selectedGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "editAcc",
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Obx(
          () => CustomButton(
            onPressed: () {
              _accountController
                  .updateUser(_userController.user.value!.copyWith(
                name: _fullNameController.text,
                email: _emailController.text,
                username: _usernameController.text,
                profileImage: _accountController.tempAvatarPath.value ??
                    _userController.user.value!.profileImage,
                birthday: _selectedBirthday.value,
              ));
            },
            child: _accountController.isLoading.value
                ? const LoadingFadingCircle()
                : CustomTextWidget(
                    text: "saveInfo",
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding,
        child: Column(
          children: [
            Center(child: AvatarPickerWidget()),
            SizedBox(height: 14.h),
            const CustomTextWidget(
              text: "changePicture",
              textThemeStyle: TextThemeStyleEnum.displaySmall,
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
                      textThemeStyle: TextThemeStyleEnum.displaySmall,
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
            AccountBirthdaySelection(
              onChanged: (value) {
                _selectedBirthday.value = value;
              },
              selectedBirthday: _selectedBirthday,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                    maxHeight: 0.9.sh,
                    minWidth: 1.sw,
                  ),
                  context: context,
                  builder: (context) {
                    return const CountryScreen();
                  },
                );
              },
              child: AbsorbPointer(
                absorbing: true,
                child: Obx(
                  () {
                    final selectedCountry = (_accountController
                                    .selectedCountry.value.name !=
                                null &&
                            _accountController.selectedCountry.value.flag !=
                                null)
                        ? (Get.locale?.languageCode == "ar"
                            ? "${_accountController.selectedCountry.value.name_ar} ${_accountController.selectedCountry.value.flag}"
                            : "${_accountController.selectedCountry.value.name} ${_accountController.selectedCountry.value.flag}")
                        : null;

                    return TextWithTextField(
                      text: "country",
                      controller: TextEditingController(
                        text: selectedCountry ??
                            _userController.user.value?.country?.name ??
                            "",
                      ),
                      hintText: "country",
                      suffix: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    );
                  },
                ),
              ),
            ),
            AccountGenderSelection(
              selectedGender: _selectedGender,
              onChanged: (value) {
                _selectedGender.value = value;
              },
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
                  suffix: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
