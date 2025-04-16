class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double starts;
  int distance;
  List<String> categories;

  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.starts,
    required this.distance,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'starts': starts,
      'distance': distance,
      'categories': categories,
    };
  }

  // Ele implementa o método tomap
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      starts: map['starts'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
    );
  }

  @override
  String toString() {
    return 'Restaurant(id: $id, imagePath: $imagePath, name: $name, description: $description, starts: $starts, distance: $distance, categories: $categories)';
  }
}
