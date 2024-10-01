class Council {
  final int id;
  final String name;
  final String position;
  final String email;
  final String contact;

  // Constructor
  Council({
    required this.id,
    required this.name,
    required this.position,
    required this.email,
    required this.contact,
  });

  // Factory method to create a Council object from a JSON or Map
  factory Council.fromJson(Map<String, dynamic> json) {
    return Council(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      email: json['email'] ?? '',
      contact: json['contact'] ?? '',
    );
  }

  // Convert the Council object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'position': position,
      'email': email,
      'contact': contact,
    };
  }

  // Method to print Council details in a readable format
  @override
  String toString() {
    return 'Council(id: $id, name: $name, position: $position, email: $email, contact: $contact)';
  }
}
