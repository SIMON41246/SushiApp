import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/shop.dart';

import 'DetailsScreen.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foods = shop.foodmenu;

    void navigatetoDetails(int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    food: foods[index],
                  )));
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cartpage');
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
        elevation: 0,
        foregroundColor: Colors.grey.shade900,
        title: Center(child: Text(" Sushi App")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Promo Banner
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 127, 53, 48),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Get 32% Promo",
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Button(text: "Redeem", onTap: () {})
                      ],
                    ),
                    Image.asset(
                      "images/sushi_picture1.png",
                      height: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  return FoodTile(
                    food: foods[index],
                    ontap: () {
                      navigatetoDetails(index);
                    },
                  );
                }),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25.0, right: 25, bottom: 25.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/bannersushi.png",
                          height: 100,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Sushi Mix",
                              style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 20, color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text("22.00£",
                                    style: GoogleFonts.dmSerifDisplay(
                                        fontSize: 20, color: Colors.black))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.grey.shade300,
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
