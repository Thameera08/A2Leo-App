import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leomd/themes/themes.dart';

class ClubCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  ClubCard({
    required this.title,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.85; // 85% of the screen width
    final fontSize = cardWidth * 0.08; // Font size based on card width

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
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // SVG Icon with flexible size
                SvgPicture.asset(
                  iconPath,
                  width: fontSize * 1.5, // Adjust icon size based on font size
                  height: fontSize * 1.5,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                SizedBox(width: 10),
                // Title with border effect for text
                Flexible(
                  child: Stack(
                    children: [
                      // Border text for title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Main title text
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ).animate().fade(duration: 300.ms).scale(duration: 400.ms),
      ),
    );
  }
}
