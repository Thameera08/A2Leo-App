class Club {
  final int id;
  final String clubName;
  final String clubPresidentName;
  final String clubPresidentEmail;
  final String clubPresidentContact;

  // Constructor to initialize a Club object
  Club({
    required this.id,
    required this.clubName,
    required this.clubPresidentName,
    required this.clubPresidentEmail,
    required this.clubPresidentContact,
  });

  // Factory method to create a Club object from a JSON or Map
  factory Club.fromMap(Map<String, dynamic> map) {
    return Club(
      id: map['id'],
      clubName: map['club_name'],
      clubPresidentName: map['club_president_name'],
      clubPresidentEmail: map['club_president_email'],
      clubPresidentContact: map['club_president_contact'],
    );
  }

  // Method to convert the Club object back into a Map (for serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'club_name': clubName,
      'club_president_name': clubPresidentName,
      'club_president_email': clubPresidentEmail,
      'club_president_contact': clubPresidentContact,
    };
  }

  @override
  String toString() {
    return 'Club{id: $id, clubName: $clubName, clubPresidentName: $clubPresidentName, clubPresidentEmail: $clubPresidentEmail, clubPresidentContact: $clubPresidentContact}';
  }
}
