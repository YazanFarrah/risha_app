import 'package:risha_app/config/json_constants.dart';

class UserNicknameModel {
  final String title;
  final String description;
  final String? logo;

  UserNicknameModel({
    required this.title,
    required this.description,
    this.logo,
  });

  factory UserNicknameModel.fromJson(Map<String, dynamic> json) {
    return UserNicknameModel(
      title: json[UserNickNameModelConstants.title],
      description: json[UserNickNameModelConstants.description],
      logo: json[UserNickNameModelConstants.logo],
    );
  }
}
