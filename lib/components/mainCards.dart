// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:leomd/themes/themes.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final ImageProvider img;
  final VoidCallback onTap;

  DashboardItem({
    required this.title,
    required this.onTap,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust width and height based on screen size
    final cardWidth = screenWidth * 0.45;  // 45% of screen width
    final cardHeight = screenHeight * 0.22; // 22% of screen height

    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: title,
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Card(
            color: AppColors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Background image with overlay
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      image: img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Semi-transparent overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                // Text background shadow and title
                Positioned(
                  bottom: cardHeight * 0.15,  // Adjust position based on height
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: cardWidth * 0.1,  // Font size based on width
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fade(duration: 400.ms).scale(duration: 300.ms).then(delay: 200.ms), // Animation chain for fade and scale
        ),
      ),
    );
  }
}
