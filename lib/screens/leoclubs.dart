import 'package:flutter/material.dart';

class LeoClubs extends StatefulWidget {
  const LeoClubs({super.key});

  @override
  State<LeoClubs> createState() => _LeoClubsState();
}

class _LeoClubsState extends State<LeoClubs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Leo Clubs'),
      ),
    );
  }
}
