// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leomd/components/council_card.dart';
import 'package:leomd/auth/auth.dart'; // AuthHelper with Dio integration
import 'package:leomd/models/councilM.dart';
import 'package:leomd/themes/themes.dart';
import 'package:leomd/widgets/nav_bar.dart';

class CouncilScreen extends StatefulWidget { // Changed to CouncilScreen to avoid confusion with model name
  const CouncilScreen({super.key});

  @override
  State<CouncilScreen> createState() => _CouncilScreenState();
}

class _CouncilScreenState extends State<CouncilScreen> {
  List<Council> councilMembers = []; // Using List<Council> to store council members
  bool isLoading = true; // Loading indicator state

  @override
  void initState() {
    super.initState();
    _loadCouncilMembers();
  }

  // Fetching council members using AuthHelper
  void _loadCouncilMembers() async {
    try {
      // Fetch from AuthHelper (Dio) and ensure the result is List<Council>
      List<Council> members = await AuthHelper().getCouncilMembers();
      
      setState(() {
        councilMembers = members; // Assign the fetched data
        isLoading = false; // Data loaded
      });
    } catch (e) {
      print('Error fetching council members: $e');
      setState(() {
        isLoading = false; // In case of error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FinalPage(),
          ),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "A2 Council",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => FinalPage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                AppColors.primary2,
                AppColors.primary3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    ) // Display a loading indicator while fetching data
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          childAspectRatio: 4.0,
                          crossAxisCount: 1,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          padding: const EdgeInsets.all(16.0),
                          children: councilMembers.map((member) {
                            return CouncilCard(
                              title: member.name, // Use the Council model field
                              onTap: () {
                                // You can add navigation or other actions here
                              },
                              icon: Icon(CupertinoIcons.profile_circled), // Static icon (assuming council data has no icon)
                              position: member.position, // Use position from Council model
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
