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
      backgroundColor: AppColors.white,
      body:  Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
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
