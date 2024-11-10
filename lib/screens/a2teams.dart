// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/themes/themes.dart';

class A2teams extends StatefulWidget {
  const A2teams({super.key});

  @override
  State<A2teams> createState() => _A2teamsState();
}

class _A2teamsState extends State<A2teams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A2 Leaders",
          style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardItem(
                          title: "A2 Teams",
                          onTap: () {},
                          img: AssetImage('lib/images/dplogo.png'),
                        ),
                        DashboardItem(
                          title: "A2 Teams",
                          onTap: () {},
                          img: AssetImage('lib/images/dplogo.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashboardItem(
                          title: "A2 Teams",
                          onTap: () {},
                          img: AssetImage('lib/images/dplogo.png'),
                        ),
                        DashboardItem(
                          title: "Lions Cabinet\n    Executive",
                          onTap: () {},
                          img: AssetImage('lib/images/dplogo.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
