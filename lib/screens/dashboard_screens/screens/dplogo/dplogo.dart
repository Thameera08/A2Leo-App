import 'package:flutter/material.dart';
import 'package:leomd/themes/themes.dart';

class DPLogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('District President Logo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'lib/images/dplogo.png', // Make sure to add your logo image in the assets folder
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'District President Logo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'The logo of the District President represents leadership, vision, and commitment to excellence. It symbolizes the unity and strength of our community, and our dedication to achieving our goals.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Motto',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '"Leading with Integrity and Vision"',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              'This motto reflects the core values of our District President. It emphasizes the importance of leading with honesty, transparency, and a clear vision for the future.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}