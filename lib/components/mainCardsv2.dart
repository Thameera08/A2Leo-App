import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:leomd/themes/themes.dart';

class MainCardV2 extends StatelessWidget {
  final String title;
  final ImageProvider img;
  final VoidCallback onTap;

  const MainCardV2({
    super.key,
    required this.title,
    required this.onTap,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive adjustments
    final cardWidth = screenWidth * 0.9; // 90% of screen width
    final cardHeight = screenHeight * 0.18; // 18% of screen height
    final fontSize = cardWidth * 0.05; // Font size based on card width
    final imageDimension = cardHeight * 1.1; // Image size based on card height

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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.primary1,
                  width: 2,
                ),
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
                        width: imageDimension,
                        height: imageDimension,
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
                  // Title text with shadow background
                  Positioned(
                    bottom: cardHeight * 0.25,
                    child: Stack(
                      children: [
                        // Main text (foreground)
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
              .animate()
              .fade(duration: 400.ms)
              .scale(duration: 300.ms)
              .then(delay: 200.ms),
        ),
      ),
    );
  }
}
