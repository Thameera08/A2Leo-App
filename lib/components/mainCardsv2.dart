// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:leomd/themes/themes.dart';

class MainCardV2 extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MainCardV2({
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: title,
        child: SizedBox(
          width: 390,
          height: 120,
          child: Card(
             color: AppColors.white,
            elevation: 8,
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
                Icon(
                  icon,
                  size: 50,
                  color: AppColors.primary1,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primary1,
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