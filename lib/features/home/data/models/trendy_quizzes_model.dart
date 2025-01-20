import 'package:risha_app/config/json_constants.dart';

class TrendyQuizzesModel {
  final int id;
  final String arName;
  final String enName;
  final int quizzesCount;
  final String icon;
  final String colorCode;
  TrendyQuizzesModel({
    required this.id,
    required this.arName,
    required this.enName,
    required this.icon,
    required this.quizzesCount,
    required this.colorCode,
  });

  factory TrendyQuizzesModel.fromJson(Map<String, dynamic> json) =>
      TrendyQuizzesModel(
        id: json[TrendyQuizzesModelConstants.id],
        arName: json[TrendyQuizzesModelConstants.arName],
        enName: json[TrendyQuizzesModelConstants.enName],
        icon: json[TrendyQuizzesModelConstants.icon],
        quizzesCount: json[TrendyQuizzesModelConstants.quizzesCount],
        colorCode: json[TrendyQuizzesModelConstants.colorCode],
      );
}
