// ignore_for_file: avoid_print

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AuthHelper {
  static final AuthHelper _instance = AuthHelper._internal();
  factory AuthHelper() => _instance;
  static Database? _database;

  AuthHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'lib/data/app_database.db');
    print('Database path: $path'); // Debug statement
    return await openDatabase(
      path,
      version: 2, // Increment this version number when you change the schema
      onCreate: _onCreate,
    );
  }

  // Create tables for council members, clubs, and any other entities
  Future<void> _onCreate(Database db, int version) async {
    print('Creating database tables...'); // Debug statement
    await db.execute('''
      CREATE TABLE council_members (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        position TEXT NOT NULL,
        icon TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE club_details (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        club_name TEXT NOT NULL,
        club_president TEXT,
        club_region TEXT
      );
    ''');

    // Insert sample data
    await _insertSampleData(db);
  }

  // Insert sample data into the tables
  Future<void> _insertSampleData(Database db) async {
    print('Inserting sample data...'); // Debug statement

    // Sample data for council members
    List<Map<String, dynamic>> councilMembers = [
      {'name': 'Alice Johnson', 'position': 'President', 'icon': 'lib/images/dplogo.png'},
      {'name': 'Bob Smith', 'position': 'Vice President', 'icon': 'lib/images/dplogo.png'},
      {'name': 'Charlie Brown', 'position': 'Secretary', 'icon': 'lib/images/dplogo.png'},
    ];

    for (var member in councilMembers) {
      await db.insert('council_members', member);
      print('Inserted council member: ${member['name']}'); // Debug statement
    }

    // Sample data for club details
    List<Map<String, dynamic>> clubDetails = [
      {'club_name': 'Leo Club of University of Sri Jayawardhanapura', 'club_president': 'Alice Johnson', 'club_region': 'North'},
      {'club_name': 'Leo Club of Sri Lanka Technological Campus', 'club_president': 'Bob Smith', 'club_region': 'South'},
      {'club_name': 'Leo Club of Godigamuwa', 'club_president': 'Charlie Brown', 'club_region': 'East'},
      {'club_name': 'Leo Club of Colombo', 'club_president': 'Alice Johnson', 'club_region': 'West'},
      {'club_name': 'Leo Club of Kandy', 'club_president': 'Bob Smith', 'club_region': 'Central'},
      {'club_name': 'Leo Club of Galle', 'club_president': 'Charlie Brown', 'club_region': 'South'},
      {'club_name': 'Leo Club of Matara', 'club_president': 'Alice Johnson', 'club_region': 'South'},
      {'club_name': 'Leo Club of Jaffna', 'club_president': 'Bob Smith', 'club_region': 'North'},
      {'club_name': 'Leo Club of Anuradhapura', 'club_president': 'Charlie Brown', 'club_region': 'North'},
    ];

    for (var club in clubDetails) {
      await db.insert('club_details', club);
      print('Inserted club: ${club['club_name']}'); // Debug statement
    }
  }

  // Fetch council members
  Future<List<Map<String, dynamic>>> getCouncilMembers() async {
    Database db = await database;
    return await db.query('council_members');
  }

  // Fetch club details
  Future<List<Map<String, dynamic>>> getClubDetails() async {
    Database db = await database;
    return await db.query('club_details');
  }
}
