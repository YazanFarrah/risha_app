import 'package:get/get.dart';
import 'package:risha_app/features/quiz/enums/available_quizzes_filter_enum.dart';

class SectionAvailableQuizzesController extends GetxController {
  final isLoading = false.obs;
  final filter = AvailableQuizzesFilterEnum.all.obs;

  void changeStatusFilter(AvailableQuizzesFilterEnum filter) {
    this.filter(filter);
  }
}
