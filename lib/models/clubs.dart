class Club {
  final int id;
  final String clubName;
  final String clubPresidentName;
  final String clubPresidentEmail;
  final String clubPresidentContact;

  // Constructor
  Club({
    required this.id,
    required this.clubName,
    required this.clubPresidentName,
    required this.clubPresidentEmail,
    required this.clubPresidentContact,
  });

  // Factory method to create a Club object from a JSON or Map
  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'] ?? 0,
      clubName: json['club_name'] ?? '',
      clubPresidentName: json['club_president_name'] ?? '',
      clubPresidentEmail: json['club_president_email'] ?? '',
      clubPresidentContact: json['club_president_contact'] ?? '',
    );
  }

  // Convert the Club object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'club_name': clubName,
      'club_president_name': clubPresidentName,
      'club_president_email': clubPresidentEmail,
      'club_president_contact': clubPresidentContact,
    };
  }

  // Method to print Club details in a readable format
  @override
  String toString() {
    return 'Club(id: $id, clubName: $clubName, clubPresidentName: $clubPresidentName, clubPresidentEmail: $clubPresidentEmail, clubPresidentContact: $clubPresidentContact)';
  }
}
