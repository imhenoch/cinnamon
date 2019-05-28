class Language {
  int id;
  String language;

  Language({
    this.id,
    this.language,
  });

  factory Language.fromJson(Map<String, dynamic> json) => new Language(
    id: json["id"],
    language: json["language"],
  );
}