import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';

class AccountFaqScreen extends StatelessWidget {
  const AccountFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "faq",
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding,
        child: ExpansionTile(
          title: const Text("data"),
          backgroundColor: Get.theme.colorScheme.onSurface,
          collapsedBackgroundColor: Get.theme.colorScheme.onSurface,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          collapsedShape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          tilePadding: EdgeInsets.symmetric(horizontal: 12.w),
          children: const [
            Text("data"),
          ],
        ),
      ),
    );
  }
}
