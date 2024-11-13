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
import 'package:risha_app/features/account/presentation/controllers/account_reset_password_controller.dart';

class AccountResetPasswordScreen extends StatefulWidget {
  const AccountResetPasswordScreen({super.key});

  @override
  State<AccountResetPasswordScreen> createState() =>
      _AccountResetPasswordScreenState();
}

class _AccountResetPasswordScreenState
    extends State<AccountResetPasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showOldPass = false;
  bool _showNewPass = false;
  bool _showConfirmPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "resetPassword",
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              TextWithTextField(
                text: "oldPassword",
                hintText: "oldPassword",
                controller: _oldPasswordController,
                prefix: Icon(
                  Icons.lock,
                  color: SharedColors.greyTextColor,
                ),
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _showOldPass = !_showOldPass;
                    });
                  },
                  icon: Icon(
                    _showOldPass ? Icons.visibility : Icons.visibility_off,
                    color: SharedColors.greyTextColor,
                  ),
                ),
                isPass: !_showOldPass,
                validator: (value) => passwordValidator(value, context),
              ),
              TextWithTextField(
                text: "newPassword",
                hintText: "newPassword",
                controller: _newPasswordController,
                prefix: Icon(
                  Icons.lock,
                  color: SharedColors.greyTextColor,
                ),
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _showNewPass = !_showNewPass;
                    });
                  },
                  icon: Icon(
                    _showNewPass ? Icons.visibility : Icons.visibility_off,
                    color: SharedColors.greyTextColor,
                  ),
                ),
                isPass: !_showNewPass,
                validator: (value) => passwordValidator(value, context),
              ),
              TextWithTextField(
                text: "confirmNewPassword",
                hintText: "confirmNewPassword",
                controller: _confirmPasswordController,
                prefix: Icon(
                  Icons.lock,
                  color: SharedColors.greyTextColor,
                ),
                suffix: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _showConfirmPass = !_showConfirmPass;
                    });
                  },
                  icon: Icon(
                    _showConfirmPass ? Icons.visibility : Icons.visibility_off,
                    color: SharedColors.greyTextColor,
                  ),
                ),
                isPass: !_showConfirmPass,
                validator: (value) => confirmPasswordValidator(
                  value,
                  _newPasswordController.text,
                  context,
                ),
                showErrorString: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: UIConstants.bodyPadding,
        child: Obx(
          () {
            final resetPasswordController =
                Get.find<AccountResetPasswordController>();
            return CustomButton(
              elevation: 8,
              width: double.infinity,
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
              },
              child: resetPasswordController.isLoading.value
                  ? const LoadingFadingCircle()
                  : CustomTextWidget(
                      text: "savePassword",
                      color: Colors.white,
                    ),
            );
          },
        ),
      ),
    );
  }
}
