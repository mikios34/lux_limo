class Airport {
  final int airportId;
  final String address;
  final double latitude;
  final double longitude;
  final String name;

  Airport({
    required this.airportId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.name,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      airportId: json['airport_id'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
    );
  }
}
