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
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: img,
                      width: 160,
                      height: 160,
                    ),
                    Container(
                      width: 390,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
                // Shadowed background for the title text
                Positioned(
                  bottom: 40,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
