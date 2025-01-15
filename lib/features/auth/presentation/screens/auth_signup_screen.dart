import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/validators/general_validations.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/loader.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';
import 'package:risha_app/core/widgets/translation_widget.dart';
import 'package:risha_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/features/auth/presentation/widgets/or_divider_widget.dart';
import 'package:risha_app/features/auth/presentation/widgets/auth_avatar_picker_widget.dart';

class AuthSignupScreen extends StatefulWidget {
  const AuthSignupScreen({super.key});

  @override
  State<AuthSignupScreen> createState() => _AuthSignupScreenState();
}

class _AuthSignupScreenState extends State<AuthSignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false;
  bool _showConfirmPass = false;
  final _authController = Get.find<AuthController>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _signupAction() async {
    if (_authController.isLoading.value) {
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await _authController.signup(
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  color: Theme.of(context).primaryColor,
                  height: 228.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: "joinRisha",
                                  color:
                                      Get.theme.colorScheme.onSurface,
                                ),
                                CustomTextWidget(
                                  text: "startLearningWithRisha",
                                  color:
                                      Get.theme.colorScheme.onSurface,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          const TranslationWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 105.h, left: 10.w, right: 10.w),
                    child: Card(
                      color: Get.theme.colorScheme.onSurface,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: AuthAvatarPicker(),
                              ),
                              SizedBox(height: 10.h),
                              TextWithTextField(
                                validator: (value) =>
                                    isNotEmpty(value, context),
                                text: "fullName",
                                hintText: "fullName".tr(context: context),
                                controller: _fullNameController,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_emailFocusNode);
                                },
                                prefix: const Icon(
                                  Icons.person,
                                  color: SharedColors.greyTextColor,
                                ),
                              ),
                              TextWithTextField(
                                validator: (value) =>
                                    emailValidator(value, context),
                                text: "email",
                                hintText: "email".tr(context: context),
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_passwordFocusNode);
                                },
                                keyType: TextInputType.emailAddress,
                                prefix: const Icon(
                                  Icons.email,
                                  color: SharedColors.greyTextColor,
                                ),
                              ),
                              TextWithTextField(
                                validator: (value) =>
                                    passwordValidator(value, context),
                                text: "password".tr(),
                                hintText: "password".tr(context: context),
                                controller: _passwordController,
                                isPass: !_showPass,
                                focusNode: _passwordFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_confirmPasswordFocusNode);
                                },
                                suffix: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      _showPass = !_showPass;
                                    });
                                  },
                                  icon: Icon(
                                    _showPass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: SharedColors.greyTextColor,
                                  ),
                                ),
                                prefix: const Icon(
                                  Icons.lock,
                                  color: SharedColors.greyTextColor,
                                ),
                              ),
                              TextWithTextField(
                                validator: (value) => confirmPasswordValidator(
                                  value,
                                  _passwordController.text,
                                  context,
                                ),
                                showErrorString: true,
                                text: "confirmPassword".tr(context: context),
                                hintText:
                                    "confirmPassword".tr(context: context),
                                controller: _confirmPasswordController,
                                isPass: !_showConfirmPass,
                                focusNode: _confirmPasswordFocusNode,
                                onFieldSubmitted: (_) {
                                  _signupAction();
                                },
                                suffix: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      _showConfirmPass = !_showConfirmPass;
                                    });
                                  },
                                  icon: Icon(
                                    _showConfirmPass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: SharedColors.greyTextColor,
                                  ),
                                ),
                                prefix: const Icon(
                                  Icons.lock,
                                  color: SharedColors.greyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: UIConstants.bodyPadding,
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      onPressed: _signupAction,
                      width: double.infinity,
                      elevation: 8,
                      child: _authController.isSignupLoading.value
                          ? const LoadingFadingCircle()
                          : CustomTextWidget(
                              text: "signup",
                              color: Get.theme.colorScheme.onSurface,
                            ),
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      width: double.infinity,
                      elevation: 8,
                      backgroundColor: Colors.transparent,
                      borderColor: Get.theme.colorScheme.primary,
                      child: CustomTextWidget(
                        text: "login",
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const OrDividerWidget(),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            backgroundColor:
                                Get.theme.colorScheme.onSurface,
                            onPressed: () {},
                            child: SvgPicture.asset(
                              AssetPaths.googleSvg,
                            ),
                          ),
                        ),
                        if (Platform.isIOS) ...{
                          SizedBox(width: 12.w),
                          Expanded(
                            child: CustomButton(
                              backgroundColor:
                                  Get.theme.colorScheme.onSurface,
                              onPressed: () {},
                              child: SvgPicture.asset(
                                AssetPaths.appleSvg,
                              ),
                            ),
                          ),
                        },
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
