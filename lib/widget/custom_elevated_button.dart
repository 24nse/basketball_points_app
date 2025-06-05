import 'package:basketball_points_counter_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, this.onPressed, required this.text,
  });
final void Function()? onPressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize:const Size(150, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
      ),
      onPressed: onPressed,
       child: CustomText(text: text,style: TextStyle(color: Colors.black, fontSize: 16),) );
  }
}


