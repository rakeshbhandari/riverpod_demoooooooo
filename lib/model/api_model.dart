class Suggestion {
  Suggestion({
    required this.name,
    required this.username,
    required this.email,
    required this.website,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
      name: json["name"],
      username: json["username"],
      email: json["email"],
      website: json["website"]);

  final String name;
  final String username;
  final String email;
  final String website;
}
