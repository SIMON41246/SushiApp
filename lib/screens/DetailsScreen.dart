import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/shop.dart';

import '../models/models.dart';

class DetailsScreen extends StatefulWidget {
  final Food food;

  DetailsScreen({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int value = 0;

  void incrementvalue() {
    setState(() {
      value++;
    });
  }

  void decrementvalue() {
    setState(() {
      if (value > 0) {
        value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(
                  "${widget.food.imagepath}",
                  height: 260,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("${widget.food.rating}"),
                        ],
                      ),
                      Text(
                        "${widget.food.name}",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Sushi is a traditional Japanese dish renowned for its artful combination of flavors, textures, and presentation. It typically consists of vinegared rice, known as 'shari' or 'sumeshi,' combined with various ingredients like raw or cooked seafood, vegetables, and occasionally tropical fruits. The most popular type of sushi is known as 'nigiri,' where small portions of fish, seafood, or other toppings are delicately placed atop bite-sized mounds of rice.",
                        style: GoogleFonts.deliusSwashCaps(
                            color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 127, 53, 48),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  height: 200,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.food.price,
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: 30, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    incrementvalue();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("${value}",
                                  style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 15, color: Colors.white)),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    decrementvalue();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Button(
                          text: "Add To Cart",
                          onTap: () {
                            addtoCart();
                          })
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void addtoCart() {
    if (value > 0) {
      var shop = context.read<Shop>();
      shop.addToCart(widget.food, value);

      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 127, 53, 48),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.done,color: Colors.white,))
              ],
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              content: Text("Succesfully Added",style: TextStyle(color: Colors.white),),
            );
          });
    }
  }
}
