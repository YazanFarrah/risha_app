import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                    text: "Select Gender",
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 10.h),
                  // Male option
                  GestureDetector(
                    onTap: () {
                      onChanged("Male");
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: "Male",
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Icon(
                          gender == "Male"
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
                      onChanged("Female");
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: "Female",
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Icon(
                          gender == "Female"
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
                text: gender.isEmpty ? "Select Gender" : gender.capitalize,
              ),
            ),
          ),
        );
      },
    );
  }
}
