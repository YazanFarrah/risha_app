class SubscriptionStatusModel {
  final int id;
  final String title;

  SubscriptionStatusModel({required this.id, required this.title});

  factory SubscriptionStatusModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionStatusModel(
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