class Suggestion {
  final String localizedName;
  final String country;
  final String key;

  Suggestion(
      {required this.localizedName, required this.country, required this.key});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
        localizedName: json["LocalizedName"],
        country: json["Country"]["LocalizedName"],
        key: json["Key"]);
  }
}
