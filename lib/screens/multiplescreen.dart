import 'package:flutter/material.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/components/mainCardsv2.dart';
import 'package:leomd/themes/themes.dart';

class Multiple extends StatefulWidget {
  const Multiple({super.key});

  @override
  State<Multiple> createState() => _MultipleState();
}

class _MultipleState extends State<Multiple> {
  @override
  Widget build(BuildContext context) {
    // Screen width for responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary1,
        title: const Text(
          'Leo Multiple',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainCardV2(
                    title: "LEO MULTIPLE",
                    onTap: () {},
                    img: AssetImage('lib/images/leomap.png'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem(
                    title: "A1",
                    onTap: () {},
                    img: AssetImage('lib/images/leomap.png'),
                  ),
                  DashboardItem(
                    title: "A2",
                    onTap: () {},
                    img: AssetImage('lib/images/leomap.png'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashboardItem(
                    title: "A1",
                    onTap: () {},
                    img: AssetImage('lib/images/leomap.png'),
                  ),
                  DashboardItem(
                    title: "A2",
                    onTap: () {},
                    img: AssetImage('lib/images/leomap.png'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardItem(
                    title: "A1",
                    onTap: () {},
                    img: AssetImage('lib/images/leomap.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
