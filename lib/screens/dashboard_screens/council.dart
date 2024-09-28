// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leomd/components/council_card.dart';
import 'package:leomd/sql/auth.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class Council extends StatefulWidget {
  const Council({super.key});

  @override
  State<Council> createState() => _CouncilState();
}

class _CouncilState extends State<Council> {
  List<Map<String, dynamic>> councilMembers = [];

  @override
  void initState() {
    super.initState();
    _loadCouncilMembers();
  }

  void _loadCouncilMembers() async {
    List<Map<String, dynamic>> members = await AuthHelper().getCouncilMembers();
    setState(() {
      councilMembers = members;
    });
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
              colors: const [
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
                    children: councilMembers.map((member) {
                      return CouncilCard(
                        title: member['name'],
                        onTap: () {},
                        icon: Image.asset(member['icon']), // You can map icons dynamically if needed
                        position: member['position'],
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
