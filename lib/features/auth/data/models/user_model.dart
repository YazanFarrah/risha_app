import 'package:risha_app/config/json_constants.dart';
import 'package:risha_app/core/enums/user_gender_enum.dart';
import 'package:risha_app/features/auth/data/models/user_nickname_model.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final UserNicknameModel? nickname;
  final UserGender? gender;
  final String? email;
  final String? password;
  final String? birthday;
  final String? notificationID;
  final bool? isEmailVerified;
  final String? avatarUrl;
  final String? profileImage;
  final int? totalPoints;
  final int? coins;
  final int? rank;
  final int? strike;
  final String? token;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastCoinsClaimedAt;
  final DateTime? lastSeenAt;
  final int? totalCorrectAnswers;
  final int? totalWrongAnswers;
  final bool? isPremium;
  final bool? isHiddenFromLeaderBoard;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.nickname,
    this.gender,
    this.email,
    this.password,
    this.birthday,
    this.notificationID,
    this.isEmailVerified,
    this.avatarUrl,
    this.profileImage,
    this.totalPoints,
    this.coins,
    this.rank,
    this.strike,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.lastCoinsClaimedAt,
    this.lastSeenAt,
    this.totalCorrectAnswers,
    this.totalWrongAnswers,
    this.isPremium,
    this.isHiddenFromLeaderBoard,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserModelConstants.id],
      name: json[UserModelConstants.name],
      username: json[UserModelConstants.username],
      // nickname: json[UserModelConstants.nickname],
      gender: json[UserModelConstants.gender],
      email: json[UserModelConstants.email],
      birthday: json[UserModelConstants.birthday],
      isEmailVerified: json[UserModelConstants.isEmailVerified],
      avatarUrl: json[UserModelConstants.avatar],
      profileImage: json[UserModelConstants.profileImage],
      token: json[UserModelConstants.token],
      totalPoints: json[UserModelConstants.totalPoints] ?? 0,
      coins: json[UserModelConstants.coins] ?? 0,
      rank: json[UserModelConstants.rank] ?? 0,
      createdAt: DateTime.tryParse(json[UserModelConstants.createdAt] ?? ''),
      updatedAt: DateTime.tryParse(json[UserModelConstants.updatedAt] ?? ''),
      lastCoinsClaimedAt:
          DateTime.tryParse(json[UserModelConstants.lastCoinsClaimedAt] ?? ''),
      lastSeenAt: DateTime.tryParse(json[UserModelConstants.lastSeenAt] ?? ''),
      totalCorrectAnswers: json[UserModelConstants.totalCorrectAnswers] ?? 0,
      totalWrongAnswers: json[UserModelConstants.totalWrongAnswers] ?? 0,
      strike: json[UserModelConstants.strike] ?? 0,
      isPremium: json[UserModelConstants.isPremium] ?? false,
      isHiddenFromLeaderBoard:
          json[UserModelConstants.isHiddenFromLeaderBoard] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserModelConstants.id: id,
      UserModelConstants.name: name,
      UserModelConstants.username: username,
      UserModelConstants.nickname: nickname,
      UserModelConstants.email: email,
      UserModelConstants.birthday: birthday,
      UserModelConstants.isEmailVerified: isEmailVerified,
      UserModelConstants.avatar: avatarUrl,
      UserModelConstants.token: token,
      UserModelConstants.totalPoints: totalPoints,
      UserModelConstants.coins: coins,
      UserModelConstants.rank: rank,
      UserModelConstants.createdAt: createdAt?.toIso8601String(),
      UserModelConstants.lastCoinsClaimedAt:
          lastCoinsClaimedAt?.toIso8601String(),
      UserModelConstants.lastSeenAt: lastSeenAt?.toIso8601String(),
      UserModelConstants.totalCorrectAnswers: totalCorrectAnswers,
      UserModelConstants.totalWrongAnswers: totalWrongAnswers,
      UserModelConstants.isPremium: isPremium,
      UserModelConstants.isHiddenFromLeaderBoard: isHiddenFromLeaderBoard,
    };
  }

  Map<String, dynamic> toRankListJson() {
    return {
      UserModelConstants.id: id,
      UserModelConstants.name: name,
      UserModelConstants.avatar: avatarUrl,
      UserModelConstants.totalPoints: totalPoints,
      UserModelConstants.rank: rank,
      UserModelConstants.isPremium: isPremium,
    };
  }

  Map<String, String> toSignupJson() {
    return {
      UserModelConstants.name: name ?? "",
      UserModelConstants.email: email ?? "",
      UserModelConstants.password: password ?? "",
      UserModelConstants.notificationID: notificationID ?? "",
    };
  }

  // CopyWith method for selective field updates
  UserModel copyWith({
    String? name,
    String? username,
    UserNicknameModel? nickname,
    String? email,
    String? birthday,
    final UserGender? gender,
    bool? isEmailVerified,
    String? avatarUrl,
    int? totalPoints,
    int? coins,
    int? rank,
    String? token,
    DateTime? createdAt,
    DateTime? lastCoinsClaimedAt,
    DateTime? lastSeenAt,
    int? totalCorrectAnswers,
    int? totalWrongAnswers,
    bool? isPremium,
    bool? isHiddenFromLeaderBoard,
  }) {
    return UserModel(
      name: name ?? this.name,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      totalPoints: totalPoints ?? this.totalPoints,
      coins: coins ?? this.coins,
      rank: rank ?? this.rank,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
      lastCoinsClaimedAt: lastCoinsClaimedAt ?? this.lastCoinsClaimedAt,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      totalCorrectAnswers: totalCorrectAnswers ?? this.totalCorrectAnswers,
      totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
      isPremium: isPremium ?? this.isPremium,
      isHiddenFromLeaderBoard:
          isHiddenFromLeaderBoard ?? this.isHiddenFromLeaderBoard,
    );
  }
}
