import 'dart:convert';

class FoodList {
  final int id;
  final String name;
  final String image;
  FoodList({required this.id, required this.name, required this.image});

  FoodList copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return FoodList(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory FoodList.fromMap(Map<String, dynamic> map) {
    return FoodList(
      id: map['id']?.toInt(),
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodList.fromJson(String source) =>
      FoodList.fromMap(json.decode(source));

  @override
  String toString() => 'Foodlist(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodList &&
        other.id == id &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
