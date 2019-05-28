class Rating {
  int id;
  String rating;

  Rating({
    this.id,
    this.rating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => new Rating(
    id: json["id"],
    rating: json["rating"],
  );
}