import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text, required this.onPressed,this.color});
final String text;
final VoidCallback onPressed; 
final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(35) ,
          color: color ??Colors.black,
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
      
      ),
    );
  }
}