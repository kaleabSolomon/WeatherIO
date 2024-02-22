class Condition {
  final String condition;

  Condition({required this.condition});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(condition: json["Headline"]["Category"]);
  }
}
