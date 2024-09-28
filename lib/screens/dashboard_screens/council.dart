// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leomd/components/council_card.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class Council extends StatefulWidget {
  const Council({super.key});

  @override
  State<Council> createState() => _CouncilState();
}

class _CouncilState extends State<Council> {
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
            "A2 Council",
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    childAspectRatio: 4.0,
                    crossAxisCount: 1,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    padding: const EdgeInsets.all(16.0),
                    children: <Widget>[
                      CouncilCard(
                        title: "Leo Thameera Dananjaya",
                        onTap: () {},
                        icon: Icon(CupertinoIcons.profile_circled),
                        position: 'Chief Couuncil Coordinator',
                      ),
                      CouncilCard(
                        title: "Leo Thameera Dananjaya",
                        onTap: () {},
                        icon: Icon(CupertinoIcons.profile_circled),
                        position: 'Zone Director - Zone A1',
                      ),
                      CouncilCard(
                        title: "Leo Thameera Dananjaya",
                        onTap: () {},
                        icon: Icon(CupertinoIcons.profile_circled),
                        position: 'Region Director - Region A',
                      ),
                      // Add more CouncilCards here
                    ],
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
