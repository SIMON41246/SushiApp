import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onTap;

  Button({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(109, 140, 94, 91),
            borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.all(25),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 12,),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
