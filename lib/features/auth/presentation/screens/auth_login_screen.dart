import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/utils/toast_utils.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/loader.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';
import 'package:risha_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:risha_app/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

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
    if (_emailController.text.isEmpty) {
      ToastUtils.showError("pleaseEnterYourEmail".tr());
      return;
    }
    if (passwordController.text.isEmpty) {
      ToastUtils.showError("pleaseEnterYourPassword".tr());
      return;
    }
    log('Login pressed');
    await _authController.login(
      email: _emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 228.h,
              width: double.infinity,
            ),
            Positioned(
              top: 90.h,
              right: 20,
              left: 20.w,
              child: Card(
                child: Padding(
                  padding: UIConstants.bodyPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWithTextField(
                        text: "email".tr(),
                        controller: _emailController,
                        width: double.infinity,
                        focusNode: _emailFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                        prefix: Icon(Icons.email),
                      ),
                      TextWithTextField(
                        text: "password".tr(),
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
                            _showPass ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                        prefix: Icon(Icons.lock),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
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
                      SizedBox(height: 20),
                      Center(
                        child: Obx(
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
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
