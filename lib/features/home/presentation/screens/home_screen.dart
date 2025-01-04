import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/home/presentation/controllers/refresh_home_data_controller.dart';
import 'package:risha_app/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/home_body.dart';
import 'package:risha_app/features/home/presentation/widgets/home_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshController = Get.find<RefreshHomeDataController>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => refreshController.refreshHomeData(),
        child: const CustomScrollView(
          slivers: [
            HomeAppbarWidget(),
            HomeHeaderWidget(),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
