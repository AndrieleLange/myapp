
class Dish {
  final String id;
  final String name;
  final String description;
  final int price;
  final String imagePath;

  const Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      imagePath: map['imagePath'] as String,
    );
  }

  @override
  String toString() {
    return 'Dish(id: $id, name: $name, description: $description, price: $price, imagePath: $imagePath)';
  }
}