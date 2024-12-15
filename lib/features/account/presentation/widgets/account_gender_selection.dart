import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:risha_app/core/utils/helper_functions.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/core/widgets/text_with_text_field.dart';

class GenderSelectionWidget extends StatelessWidget {
  final ValueNotifier<String> selectedGender;
  final ValueChanged<String> onChanged;

  const GenderSelectionWidget({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedGender,
      builder: (context, gender, _) {
        return GestureDetector(
          onTap: () {
            // Pass the current selected gender into the modal to pre-select it
            HelperFunctions.showCustomModalBottomSheet(
              showDragHandler: true,
              context: context,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextWidget(
                    text: "selectGender",
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 10.h),
                  // Male option
                  GestureDetector(
                    onTap: () {
                      onChanged("male");
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: "male",
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Icon(
                          gender == "male"
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Female option
                  GestureDetector(
                    onTap: () {
                      onChanged("female");
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: "female",
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Icon(
                          gender == "female"
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          child: AbsorbPointer(
            absorbing: true,
            child: TextWithTextField(
              text: "gender",
              controller: TextEditingController(
                text: gender.isEmpty
                    ? "selectGender".tr(context: context)
                    : gender.capitalize,
              ),
              suffix: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
        );
      },
    );
  }
}
