import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:risha_app/core/widgets/custom_text_widget.dart';
import 'package:risha_app/features/leaderboard/presentation/widgets/leaderboard_header.dart';
import 'package:risha_app/features/leaderboard/presentation/widgets/time_selection_widget.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LeaderboardAppBar(),
      body: Column(
        children: [
          Container(
            color: Get.theme.colorScheme.primary,
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TimeSelectionWidget(
                      isSelected: true,
                      text: "allTime",
                    ),
                    TimeSelectionWidget(
                      isSelected: false,
                      text: "thisWeek",
                    ),
                    TimeSelectionWidget(
                      isSelected: false,
                      text: "today",
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
