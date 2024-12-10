// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class ClubProfile extends StatefulWidget {
  final String clubName;
  final String clubPresident;
  final String clubRegion;

  const ClubProfile({
    super.key,
    required this.clubName,
    required this.clubPresident,
    required this.clubRegion,
  });

  @override
  State<ClubProfile> createState() => _ClubProfileState();
}

class _ClubProfileState extends State<ClubProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary1,
        title: const Text(
          'Club Profile',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FinalPage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('lib/images/dplogo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.clubName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.clubPresident,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            widget.clubRegion,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
