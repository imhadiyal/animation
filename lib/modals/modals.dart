class Planet {
  final String name;
  final String description;
  final String image;

  Planet({required this.name, required this.description, required this.image});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}
