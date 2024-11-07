import 'package:risha_app/config/json_constants.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
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
    this.email,
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
      email: json[UserModelConstants.email],
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
      UserModelConstants.email: email,
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

  factory UserModel.defaultUser() {
    return UserModel(
      id: null,
      name: null,
      email: null,
      avatarUrl: null,
      totalPoints: 0,
      coins: 0,
      rank: 0,
      totalCorrectAnswers: 0,
      totalWrongAnswers: 0,
      isPremium: false,
      createdAt: null,
      // token: null,
    );
  }

  // CopyWith method for selective field updates
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
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
      email: email ?? this.email,
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
