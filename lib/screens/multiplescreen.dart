import 'package:flutter/material.dart';
import 'package:leomd/components/mainCards.dart';
import 'package:leomd/themes/themes.dart';

class Multiple extends StatefulWidget {
  const Multiple({super.key});

  @override
  State<Multiple> createState() => _MultipleState();
}

class _MultipleState extends State<Multiple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
