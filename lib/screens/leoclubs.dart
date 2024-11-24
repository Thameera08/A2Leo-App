import 'package:flutter/material.dart';
import 'package:leomd/components/club_card.dart';
import 'package:leomd/themes/themes.dart';

class LeoClubs extends StatefulWidget {
  const LeoClubs({super.key});

  @override
  State<LeoClubs> createState() => _LeoClubsState();
}

class _LeoClubsState extends State<LeoClubs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary1,
        title: const Text(
          "Leo Clubs",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ClubCard(
              title: "Leo Club of Sri Lanka Technologyy Campus ",
              onTap: () {},
              iconPath: 'lib/images/home.svg',
            ),
            ClubCard(
              title: "Leo Club of Sri Lanka Technologyy Campus ",
              onTap: () {},
              iconPath: 'lib/images/home.svg',
            ),
            ClubCard(
              title: "Leo Club of Sri Lanka Technologyy Campus ",
              onTap: () {},
              iconPath: 'lib/images/home.svg',
            ),
            ClubCard(
              title: "Leo Club of Sri Lanka Technologyy Campus ",
              onTap: () {},
              iconPath: 'lib/images/home.svg',
            ),
          ],
        ),
      ),
    );
  }
}
