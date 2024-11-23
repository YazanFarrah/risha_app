import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risha_app/config/app_colors.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/validators/general_validations.dart';
import 'package:risha_app/core/widgets/custom_button.dart';
import 'package:risha_app/core/widgets/custom_form_field.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the keyboard height
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      // Adjust height based on keyboard visibility
      height: keyboardHeight > 0
          ? 400.h + keyboardHeight
          : 400.h, // Adjust this base height as needed
      padding: UIConstants.horizontalPadding,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          const CustomTextWidget(
            text: "forgotPasswordMessage",
            maxLines: 2,
          ),
          const CustomTextWidget(
            text: "forgotPasswordResetMessage",
            maxLines: 5,
            isDisplaySmall: true,
          ),
          SizedBox(height: 34.h),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomFormField(
              validator: (value) => emailValidator(value, context),
              controller: _emailController,
              focusNode: _focusNode, // Attach the focus node
              hintText: "email".tr(context: context),
              prefix: const Icon(
                Icons.email,
                color: SharedColors.greyTextColor,
              ),
            ),
          ),
          SizedBox(height: 58.h),
          CustomButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
            },
            width: double.infinity,
            child: const CustomTextWidget(
              text: "resetPassword",
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            width: double.infinity,
            backgroundColor: Colors.white,
            borderColor: Theme.of(context).colorScheme.primary,
            child: CustomTextWidget(
              text: "login",
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}