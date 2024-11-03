class PolicyHolderModel {
  final int id;
  final String title;

  PolicyHolderModel({required this.id, required this.title});

  factory PolicyHolderModel.fromJson(Map<String, dynamic> json) {
    return PolicyHolderModel(
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
