import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/validators/general_validations.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/loader.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';
import 'package:risha_app/features/auth/presentation/controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _newPasswordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  bool showNewPass = false;
  bool showConfirmNewPass = false;
  bool isPasswordValid = false;
  final _formKey = GlobalKey<FormState>();
  final resetPasswordController = Get.find<ResetPasswordController>();

  @override
  void initState() {
    _confirmPasswordController.addListener(_validatePasswords);
    super.initState();
  }

  void _validatePasswords() {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;
    setState(() {
      isPasswordValid = newPassword == confirmPassword;
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "resetPassword",
        centerTitle: false,
      ),
      bottomNavigationBar: Padding(
        padding: UIConstants.bodyPadding,
        child: Obx(
          () => CustomButton(
            backgroundColor:
                isPasswordValid ? null : SharedColors.greyTextColor,
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              resetPasswordController
                  .resetPassword(_confirmPasswordController.text);
            },
            child: resetPasswordController.isResetingPassword.value
                ? LoadingFadingCircle()
                : CustomTextWidget(text: "resetPassword", color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              TextWithTextField(
                text: "newPassword",
                controller: _newPasswordController,
                hintText: "newPassword",
                filled: true,
                fillColor: Colors.white,
                validator: (value) => isNotEmpty(value, context),
                isPass: !showNewPass,
                prefix: Icon(
                  Icons.lock,
                  color: SharedColors.greyTextColor,
                ),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      showNewPass = !showNewPass;
                    });
                  },
                  icon: Icon(
                    showNewPass ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: SharedColors.greyTextColor,
                ),
              ),
              TextWithTextField(
                text: "confirmNewPassword",
                controller: _confirmPasswordController,
                hintText: "confirmNewPassword",
                filled: true,
                fillColor: Colors.white,
                isPass: !showConfirmNewPass,
                prefix: Icon(
                  Icons.lock,
                  color: SharedColors.greyTextColor,
                ),
                validator: (value) => confirmPasswordValidator(
                  value,
                  _newPasswordController.text,
                  context,
                ),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      showConfirmNewPass = !showConfirmNewPass;
                    });
                  },
                  icon: Icon(
                    showConfirmNewPass
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  color: SharedColors.greyTextColor,
                ),
                showErrorString: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
