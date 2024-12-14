// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, file_names

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
    // Use MediaQuery to get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust width and height based on screen size
    final cardWidth = screenWidth * 0.45; // 45% of screen width
    final cardHeight = screenHeight * 0.22; // 22% of screen height

    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: title,
        child: SizedBox(
          width: 420,
          height: cardHeight,
          child: Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                    image: img,
                    width: cardWidth * 0.7, // Scale image width
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: cardHeight * 0.05), // Spacer
                // Title text
                Text(
                  title,
                  style: TextStyle(
                    fontSize: cardWidth * 0.1,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ).animate()
                .fade(duration: 400.ms)
                .scale(duration: 300.ms)
                .then(delay: 200.ms), // Animation chain for fade and scale
          ),
        ),
      ),
    );
  }
}
