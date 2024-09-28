// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:leomd/themes/themes.dart';

class CouncilCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback onTap;
  final String position;

  CouncilCard({
    required this.title,
    required this.onTap,
    required this.icon,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: title,
        child: Card(
          color: AppColors.primary1,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        icon.icon,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 40),
                      Flexible(
                        // Allows text to wrap and take up available space
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Ensures long text is handled gracefully
                          maxLines: 1, // Optionally set to 1 or more lines
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      position,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ).animate().fade().scale(),
      ),
    );
  }
}
