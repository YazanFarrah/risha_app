class ChronicDiseaseModel {
  final int id;
  final String title;

  ChronicDiseaseModel({required this.id, required this.title});

  factory ChronicDiseaseModel.fromJson(Map<String, dynamic> json) {
    return ChronicDiseaseModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}