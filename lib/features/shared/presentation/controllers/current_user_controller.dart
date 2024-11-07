import 'dart:developer';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

class CurrentUserController extends GetxController {
  final user = Rxn<UserModel>();
  void setUser(UserModel user) {
    this.user.value = user;
    log(this.user.toString());
  }

  Future<Either<Failure, UserModel>> getUser() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final user = UserModel(
        id: "123456",
        name: "Yazan Farrah",
        username: "yazan_farrah",
        email: "john.doe@example.com",
        avatarUrl: "https://images.immediate.co.uk/production/volatile/sites/3/2023/08/2023.06.28-06.20-boundingintocomics-649c79f009cdf-Cropped-8d74232.png",
        totalPoints: 500,
        coins: 200,
        rank: 3,
        token: "fcm_token_example",
        createdAt: DateTime.parse("2024-01-01T12:00:00"),
        lastCoinsClaimedAt: DateTime.parse("2024-01-15T09:30:00"),
        lastSeenAt: DateTime.parse("2024-01-20T18:45:00"),
        totalCorrectAnswers: 150,
        totalWrongAnswers: 30,
        isPremium: true,
        isHiddenFromLeaderBoard: false,
      );

      setUser(user);
      return right(user);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
