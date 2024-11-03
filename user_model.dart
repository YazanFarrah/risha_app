// import 'package:ayah_mastery/constants/json_keys_constants.dart';

// import '../../domain/entities/User.dart';

// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

// class UserModel{
//   UserModel({
//     required String? id,
//     required String? name,
//     required String? email,
//     required String? avatarUrl,
//     required int? totalPoints,
//     required int? coins,
//     required int? rank,
//     required String? fcmToken,
//     DateTime? createdAt,
//     DateTime? lastCoinsClaimedAt,
//     DateTime? lastSeenAt,
//     required int? totalCorrectAnswers,
//     required int? totalWrongAnswers,
//     required bool? isPremium,
//     bool? isHiddenFromLeaderBoard,
//   }) : super(
//           id: id,
//           name: name,
//           email: email,
//           avatarUrl: avatarUrl,
//           fcmToken: fcmToken,
//           totalPoints: totalPoints,
//           coins: coins,
//           rank: rank,
//           createdAt: createdAt,
//           lastCoinsClaimedAt: lastCoinsClaimedAt,
//           lastSeenAt: lastSeenAt,
//           totalCorrectAnswers: totalCorrectAnswers,
//           totalWrongAnswers: totalWrongAnswers,
//           isPremium: isPremium,
//         );



//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json[UserConstants.ID],
//       name: json[UserConstants.NAME],
//       email: json[UserConstants.EMAIL],
//       avatarUrl: json[UserConstants.AVATAR_URL],
//       fcmToken: json[UserConstants.FCM_TOKEN],
//       totalPoints: json[UserConstants.TOTAL_POINTS],
//       coins: json[UserConstants.COINS],
//       rank: json[UserConstants.RANK],
//       createdAt: DateTime.tryParse(json[UserConstants.CREATED_AT] ?? ''),
//       lastCoinsClaimedAt:
//           DateTime.tryParse(json[UserConstants.LAST_COINS_CLAIMED_AT] ?? ''),
//       lastSeenAt: DateTime.tryParse(json[UserConstants.LAST_SEEN_AT] ?? ''),
//       totalCorrectAnswers: json[UserConstants.TOTAL_CORRECT_ANSWERS],
//       totalWrongAnswers: json[UserConstants.TOTAL_WRONG_ANSWERS],
//       isPremium: json[UserConstants.IS_PREMIUM],
//       isHiddenFromLeaderBoard:
//           json[UserConstants.IS_HIDDEN_FROM_LEADER_BOARD] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       UserConstants.ID: id,
//       UserConstants.NAME: name,
//       UserConstants.EMAIL: email,
//       UserConstants.AVATAR_URL: avatarUrl,
//       UserConstants.FCM_TOKEN: fcmToken,
//       UserConstants.TOTAL_POINTS: totalPoints,
//       UserConstants.COINS: coins,
//       UserConstants.RANK: rank,
//       UserConstants.CREATED_AT: createdAt?.toIso8601String(),
//       UserConstants.LAST_COINS_CLAIMED_AT:
//           lastCoinsClaimedAt?.toIso8601String(),
//       UserConstants.LAST_SEEN_AT: lastSeenAt?.toIso8601String(),
//       UserConstants.TOTAL_CORRECT_ANSWERS: totalCorrectAnswers,
//       UserConstants.TOTAL_WRONG_ANSWERS: totalWrongAnswers,
//       UserConstants.IS_PREMIUM: isPremium,
//     };
//   }

//   Map<String, dynamic> toRankListJson() {
//     return {
//       UserConstants.ID: id,
//       UserConstants.NAME: name,
//       UserConstants.AVATAR_URL: avatarUrl,
//       UserConstants.TOTAL_POINTS: totalPoints,
//       UserConstants.RANK: rank,
//       UserConstants.IS_PREMIUM: isPremium,
//     };
//   }

//   factory UserModel.defaultUser() {
//     return UserModel(
//       id: null,
//       name: null,
//       email: null,
//       avatarUrl: null,
//       totalPoints: 0,
//       coins: 0,
//       rank: 0,
//       totalCorrectAnswers: 0,
//       totalWrongAnswers: 0,
//       isPremium: false,
//       createdAt: null,
//       fcmToken: null,
//     );
//   }
// }
