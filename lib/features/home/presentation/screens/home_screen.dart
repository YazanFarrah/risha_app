import 'package:flutter/material.dart';
import 'package:risha_app/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:risha_app/features/home/presentation/widgets/home_body.dart';
import 'package:risha_app/features/home/presentation/widgets/home_header_widget.dart';
import 'package:risha_app/features/shared/presentation/widgets/sliver_sizedbox_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.delayed(const Duration(seconds: 1), () {}),
        child: const CustomScrollView(
          slivers: [
            HomeAppbarWidget(),
            HomeHeaderWidget(),
            SliverSizedBox(height: 20),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
