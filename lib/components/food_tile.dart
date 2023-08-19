import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/models.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function() ontap;

  const FoodTile({Key? key, required this.food, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              food.imagepath,
              height: 120,
            ),
            Text(
              food.name,
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    food.price,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        food.rating,
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
