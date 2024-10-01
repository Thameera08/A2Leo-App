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
            builder: (context) => BottomNavBarExample(),
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
                  builder: (context) => BottomNavBarExample(),
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
              SizedBox(height: 20),
              isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator()) // Show a loader when fetching data
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          childAspectRatio: 4.0,
                          crossAxisCount: 1,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          padding: const EdgeInsets.all(16.0),
                          children: clubDetails.map((club) {
                            return ClubCard(
                              title: club.clubName,
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => ClubProfile(
                                      clubName: club.clubName,
                                      clubPresident: club.clubPresidentName,
                                      clubRegion: club.clubPresidentContact,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(CupertinoIcons.group), // Static icon
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
