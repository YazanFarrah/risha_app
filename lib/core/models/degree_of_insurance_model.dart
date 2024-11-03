class DegreeOfInsuranceModel {
  final int id;
  final String title;

  DegreeOfInsuranceModel({required this.id, required this.title});

  factory DegreeOfInsuranceModel.fromJson(Map<String, dynamic> json) {
    return DegreeOfInsuranceModel(
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