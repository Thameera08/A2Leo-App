// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leomd/components/club_card.dart';
import 'package:leomd/models/clubs.dart'; // Club model
import 'package:leomd/screens/clubProfile/clubProfile.dart';
import 'package:leomd/auth/auth.dart'; // AuthHelper with Dio integration
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class Clubs extends StatefulWidget {
  const Clubs({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  List<Club> clubDetails = []; // Using the Club model for storing club details
  bool isLoading = true; // To handle the loading state

  @override
  void initState() {
    super.initState();
    _loadClubDetails();
  }

  // Fetching the club details using AuthHelper
  void _loadClubDetails() async {
    try {
      // Fetching the club details, which already returns a List<Club>
      List<Club> clubs = await AuthHelper().getClubDetails();

      setState(() {
        // Directly assigning the fetched list of clubs to clubDetails
        clubDetails = clubs;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching club details: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FinalPage(),
          ),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "A2 Clubs",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => FinalPage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary2,
                AppColors.primary3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
             
            ],
          ),
        ),
      ),
    );
  }
}
