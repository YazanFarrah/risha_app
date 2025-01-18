import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/leaderboard/enums/leaderboard_filter_time_enum.dart';
import 'package:risha_app/features/leaderboard/presentation/controllers/leaderboard_filters_controller.dart';
import 'package:risha_app/features/leaderboard/presentation/widgets/leaderboard_header.dart';
import 'package:risha_app/features/leaderboard/presentation/widgets/time_selection_widget.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboardFiltersController =
        Get.find<LeaderboardFiltersController>();

    final timeFilters = [
      {'label': 'allTime', 'value': LeaderboardFilterTimeEnum.allTime},
      {'label': 'thisWeek', 'value': LeaderboardFilterTimeEnum.thisWeek},
      {'label': 'today', 'value': LeaderboardFilterTimeEnum.today},
    ];

    return Scaffold(
      appBar: const LeaderboardAppBar(),
      body: Obx(
        () => Column(
          children: [
            Container(
              color: Get.theme.colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: timeFilters.map((filter) {
                  final isSelected =
                      leaderboardFiltersController.timeFilter.value ==
                          filter['value'];
                  return GestureDetector(
                    onTap: () => leaderboardFiltersController.changeTimeFilter(
                        filter['value'] as LeaderboardFilterTimeEnum),
                    child: TimeSelectionWidget(
                      isSelected: isSelected,
                      text: filter['label'] as String,
                    ),
                  );
                }).toList(),
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
      ),
    );
  }
}
