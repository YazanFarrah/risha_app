import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:risha_app/features/auth/data/models/user_nickname_model.dart';

class AuthRemoteDatasource {
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final user = UserModel(
        id: "123456",
        name: "Yazan Farrah",
        username: "yazan_farrah",
        nickname: UserNicknameModel(
          title: "المستكشف",
          description: "وهو الباحث عن المعرفة في ريشة المعرفة",
        ),
        email: "john.doe@example.com",
        avatarUrl: "https://example.com/avatar.jpg",
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

      return right(user);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> signup(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final user = UserModel(
        id: "123456",
        name: "John Doe",
        email: "john.doe@example.com",
        avatarUrl: "https://example.com/avatar.jpg",
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

      return right(user);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
