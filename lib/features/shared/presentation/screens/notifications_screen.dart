import 'package:flutter/material.dart';
import 'package:risha_app/core/utils/shared.dart';
import 'package:risha_app/core/widgets/custom_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "notifications",
      ),
      body: SingleChildScrollView(
        padding: UIConstants.bodyPadding,
      ),
    );
  }
}
