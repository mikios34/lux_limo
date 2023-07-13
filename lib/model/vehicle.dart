class Vehicle {
  final String name;
  final int capacity;
  final num price;
  final String image;
  final String? color;
  final String description;
  final String type;
  final bool isSaved;

  const Vehicle(
      {required this.name,
      required this.capacity,
      required this.price,
      required this.image,
      required this.description,
      required this.type,
      required this.isSaved,
      this.color});

  factory Vehicle.fromJson(Map<String, dynamic> data) {
    return Vehicle(
        name: data['name'],
        capacity: data['capacity'],
        price: data['price_mile'],
        image: data['image'],
        description: data['description'],
        type: data['category'],
        color: data['color'],
        isSaved: data['is_saved']);
  }
}
