
import 'package:basketball_points_counter_app/widget/custom_elevated_button.dart';
import 'package:basketball_points_counter_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({
    super.key,  required this.teamName, required this.points,required this.onPressed,
  });
final String teamName;
final String points;
final  Function(int) onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: teamName, style: TextStyle(
          fontSize: 32,
        ),),
        CustomText(text: points, style: TextStyle(
          fontSize: 90,
        ),),
        CustomElevatedButton(text: "Add 1 Point",onPressed: ()=>onPressed(1),),
        const SizedBox(height: 16,),
        CustomElevatedButton(text: "Add 2 Point",onPressed:  ()=>onPressed(2),),
      const SizedBox(height: 16,),
        CustomElevatedButton(text: "Add 3 Point",onPressed:  ()=>onPressed(3),),
      ],
    );
  }
}


