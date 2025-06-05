import 'package:basketball_points_counter_app/widget/custom_elevated_button.dart';
import 'package:basketball_points_counter_app/widget/team_sections.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatefulWidget {
 const  PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
 int teamAPoints=0;
 int teamBPoints=0;
   void resetPoints() {
    setState(() {
      teamAPoints = 0;
      teamBPoints = 0;
    });
  }

  void addPoints(String team, int points) {
    setState(() {
      if (team == 'A') {
        teamAPoints += points;
      } else {
        teamBPoints += points;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Points Counter"),
        ),
        body: Column(
          children: [
             const  SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            TeamSection(teamName: "Team A",points: "$teamAPoints",onPressed: (points)=>addPoints("A",points),),
            const SizedBox(
              height: 350,
              child: VerticalDivider(color: Colors.grey,thickness: 1,)),
            TeamSection(teamName: "Team B",points: "$teamBPoints", onPressed: (points)=>addPoints("B",points),),
            
              ],
            ),
           const SizedBox(height: 50,),
          CustomElevatedButton(text: "Reset", onPressed: resetPoints)
          ],
        ),
      ),
   
    );
  }
}


