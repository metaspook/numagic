class Food {
  final int id;
  final String name;
  final String image;

  Food({
    required this.id,
    required this.name,
    required this.image,
  });

  // create model object from json object.
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
