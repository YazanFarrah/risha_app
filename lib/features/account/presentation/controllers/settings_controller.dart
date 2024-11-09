import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool dailyCoinsCollectionReminder = false.obs;
  final RxBool newQuizReminder = false.obs;
  final RxBool hideMeInLeaderboard = false.obs;
  final RxBool vibrateOnWrongAnswer = false.obs;

  // Toggle daily coins collection reminder
  void toggleDailyCoinsCollectionReminder(bool value) {
    dailyCoinsCollectionReminder.value = value;
  }

  // Toggle new quiz reminder
  void toggleNewQuizReminder(bool value) {
    newQuizReminder.value = value;
  }

  // Toggle hide me in leaderboard
  void toggleHideMeInLeaderboard(bool value) {
    hideMeInLeaderboard.value = value;
  }

  // Toggle vibrate on wrong answer
  void toggleVibrateOnWrongAnswer(bool value) {
    vibrateOnWrongAnswer.value = value;
  }
}
