class Suggestion {
  final String city;
  final String country;
  final String locationKey;

  Suggestion(
      {required this.city, required this.country, required this.locationKey});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
        city: json["LocalizedName"] as String,
        country: json["Country"]["LocalizedName"] as String,
        locationKey: json["Key"] as String);
  }
}
