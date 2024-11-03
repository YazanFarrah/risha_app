import 'dart:developer';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/config/asset_paths.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/validators/general_validations.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/loader.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';
import 'package:risha_app/core/widgets/translation_widget.dart';
import 'package:risha_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:risha_app/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/features/auth/presentation/widgets/or_divider_widget.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final _emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false;
  final _authController = Get.find<AuthController>();

  @override
  void dispose() {
    _emailController.dispose();
    passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _loginAction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await _authController.login(
      email: _emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    log("text");
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: UIConstants.bodyPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () {
                return CustomButton(
                  onPressed: _loginAction,
                  width: double.infinity,
                  elevation: 8,
                  child: _authController.isLoading.value
                      ? const Loader(
                          color: Colors.black,
                        )
                      : CustomTextWidget(
                          text: "login",
                          color: Colors.white,
                        ),
                );
              },
            ),
            SizedBox(height: 10.h),
            CustomButton(
              onPressed: () {
                Get.toNamed(RoutePaths.signup);
              },
              width: double.infinity,
              elevation: 8,
              backgroundColor: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              child: CustomTextWidget(
                text: "signup",
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 30.h),
            OrDividerWidget(),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.white,
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
                      backgroundColor: Colors.white,
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
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                                text: "مرحبا بك!",
                                color: Colors.white,
                              ),
                              CustomTextWidget(
                                text:
                                    "قم بتسجيل الدخول للاستمرار باستخدام ريشة المعرفة.",
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        TranslationWidget(),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h, left: 10.w, right: 10.w),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: UIConstants.bodyPadding,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CustomTextWidget(
                                text: "login",
                                color: Theme.of(context).colorScheme.primary,
                                isDisplayLarge: true,
                              ),
                            ),
                            TextWithTextField(
                              validator: (value) =>
                                  emailValidator(value, context),
                              text: "email",
                              hintText: "email".tr(context: context),
                              controller: _emailController,
                              width: double.infinity,
                              focusNode: _emailFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              },
                              prefix: Icon(
                                Icons.email,
                                color: SharedColors.greyTextColor,
                              ),
                            ),
                            TextWithTextField(
                              validator: (value) =>
                                  passwordValidator(value, context),
                              text: "password".tr(),
                              hintText: "password".tr(context: context),
                              controller: passwordController,
                              width: double.infinity,
                              isPass: !_showPass,
                              focusNode: _passwordFocusNode,
                              onFieldSubmitted: (_) {
                                _loginAction();
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
                              prefix: Icon(
                                Icons.lock,
                                color: SharedColors.greyTextColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  showDragHandle: true,
                                  context: context,
                                  builder: (context) {
                                    return ForgotPasswordWidget();
                                  },
                                );
                              },
                              child: CustomTextWidget(
                                text: "forgotPassword",
                                color: Theme.of(context).colorScheme.primary,
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
        ),
      ),
    );
  }
}
