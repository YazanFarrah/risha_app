import 'dart:developer';
import 'package:risha_app/core/enums/user_gender_enum.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/core/routes/route_paths.dart';
import 'package:risha_app/core/services/hive_services.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/auth/data/models/user_nickname_model.dart';

class CurrentUserController extends GetxController {
  final user = Rxn<UserModel>();
  final tempAvatarPath = Rxn<String>();
  final _hiveService = Get.find<HiveServices>();

  void setUser(UserModel user) {
    this.user.value = user;
    log(this.user.toString());
  }

  void updateAvatarUrl(String? newUrl) {
    user.value = user.value?.copyWith(avatarUrl: newUrl);
    tempAvatarPath.value = null;
  }

  void updateTempAvatarPath(String? path) {
    tempAvatarPath.value = path;
  }

  Future<Either<Failure, UserModel>> getUser() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final user = UserModel(
        id: "123456",
        name: "Yazan Farrah",
        username: "yazan_farrah",
        nickname: UserNicknameModel(
          title: "المستكشف",
          description: "وهو الباحث عن المعرفة في ريشة المعرفة",
        ),
        email: "john.doe@example.com",
        isEmailVerified: true,
        gender: UserGender.female,
        avatarUrl:
            "https://images.immediate.co.uk/production/volatile/sites/3/2023/08/2023.06.28-06.20-boundingintocomics-649c79f009cdf-Cropped-8d74232.png",
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

  void logUserOut() {
    _hiveService.clearPreferences();
    user.value = null;
    Get.offAllNamed(RoutePaths.login);
  }
}
