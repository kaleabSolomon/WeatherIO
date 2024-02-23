import "package:hive/hive.dart";

part "condition.g.dart";

@HiveType(typeId: 1)
class Condition extends HiveObject {
  @HiveField(0)
  final String condition;

  Condition({required this.condition});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(condition: json["Headline"]["Category"]);
  }
}
