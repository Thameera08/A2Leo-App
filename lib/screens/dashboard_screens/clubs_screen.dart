// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class RandD extends StatefulWidget {
  const RandD({super.key});

  @override
  State<RandD> createState() => _RandDState();
}

class _RandDState extends State<RandD> {




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
            "A2 RandD",
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
            children: [],
          ),
        ),
      ),
    );
  }
}
