import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/models.dart';

import '../models/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removefromcart(Food food) {
    var shop = context.read<Shop>();
    shop.removefromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color.fromARGB(255, 127, 53, 48),
                title: Center(
                    child: Text(
                  "My Cart",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              body: Container(
                color: Color.fromARGB(255, 127, 53, 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            final Food food = value.cart[index];
                            final String foodname = food.name;
                            final String foodprice = food.price;
                            return Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 155, 107, 104),
                              ),
                              child: ListTile(
                                leading: Image.asset(food.imagepath),
                                title: Text(
                                  foodname,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  foodprice,
                                  style: TextStyle(color: Colors.grey.shade900),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    removefromcart(food);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            );
                          }),
                    ),
                    Button(
                      text: "Pay Now",
                      onTap: () {
                        // Bottomsheet
                        if (value.cart.isEmpty) {
                          final snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Warning!',
                              message:'you Have not order yet !!',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.warning,
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        } else {
                          showModalBottomSheet<void>(
                            backgroundColor: Color.fromARGB(255, 230, 217, 217),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            // context and builder are
                            // required properties in this widget
                            context: context,
                            builder: (BuildContext context) {
                              return Container(

                                margin: EdgeInsets.only(top: 70),
                                child: Expanded(
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        title: Text("PayPal"),
                                        leading: Image.asset("images/paypal.png"),
                                        trailing: TextButton(
                                          onPressed: () {},
                                          child: Text("Pay Now"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ListTile(
                                        title: Text("\t Card"),
                                        leading: Image.asset("images/payment.png"),
                                        trailing: TextButton(
                                          onPressed: () {},
                                          child: Text("Pay Now"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ListTile(
                                        title: Text("\t Payonner"),
                                        leading: Image.asset(
                                            "images/Payoneer-square.png"),
                                        trailing: TextButton(
                                          onPressed: () {},
                                          child: Text("Pay Now"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
