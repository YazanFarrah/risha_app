import 'package:risha_app/config/json_constants.dart';
import 'package:risha_app/core/enums/user_gender_enum.dart';
import 'package:risha_app/features/auth/data/models/user_nickname_model.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? username;
  final UserNicknameModel? nickname;
  final UserGender? gender;
  final String? email;
  final bool? isEmailVerified;
  final String? avatarUrl;
  final int? totalPoints;
  final int? coins;
  final int? rank;
  final String? token;
  final DateTime? createdAt;
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
    this.isEmailVerified,
    this.avatarUrl,
    this.totalPoints,
    this.coins,
    this.rank,
    this.token,
    this.createdAt,
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
      nickname: json[UserModelConstants.nickname],
      gender: json[UserModelConstants.gender],
      email: json[UserModelConstants.email],
      isEmailVerified: json[UserModelConstants.isEmailVerified],
      avatarUrl: json[UserModelConstants.avatar],
      token: json[UserModelConstants.token],
      totalPoints: json[UserModelConstants.totalPoints],
      coins: json[UserModelConstants.coins],
      rank: json[UserModelConstants.rank],
      createdAt: DateTime.tryParse(json[UserModelConstants.createdAt] ?? ''),
      lastCoinsClaimedAt:
          DateTime.tryParse(json[UserModelConstants.lastCoinsClaimedAt] ?? ''),
      lastSeenAt: DateTime.tryParse(json[UserModelConstants.lastSeenAt] ?? ''),
      totalCorrectAnswers: json[UserModelConstants.totalCorrectAnswers],
      totalWrongAnswers: json[UserModelConstants.totalWrongAnswers],
      isPremium: json[UserModelConstants.isPremium],
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

  // CopyWith method for selective field updates
  UserModel copyWith({
    String? id,
    String? name,
    String? username,
    UserNicknameModel? nickname,
    String? email,
    final UserGender? gender,
    bool? isEmailVerified,
    String? avatarUrl,
    int? totalPoints,
    int? coins,
    int? rank,
    // String? token,
    DateTime? createdAt,
    DateTime? lastCoinsClaimedAt,
    DateTime? lastSeenAt,
    int? totalCorrectAnswers,
    int? totalWrongAnswers,
    bool? isPremium,
    bool? isHiddenFromLeaderBoard,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      totalPoints: totalPoints ?? this.totalPoints,
      coins: coins ?? this.coins,
      rank: rank ?? this.rank,
      // token: token ?? this.token,
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
