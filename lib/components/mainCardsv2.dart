// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:leomd/themes/themes.dart';

class MainCardV2 extends StatelessWidget {
  final String title;
  final ImageProvider img;
  final VoidCallback onTap;

  MainCardV2({
    required this.title,
    required this.onTap,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: title,
        child: SizedBox(
          width: 390,
          height: 150,
          child: Card(
             color: AppColors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: img,
                  width: 100,
                  height: 100,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primary1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ).animate().fade().scale(),
        ),
      ),
    );
  }
}