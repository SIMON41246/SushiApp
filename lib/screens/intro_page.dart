import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 53, 48),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "SUSHI MAN",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("images/sushi_intro.png"),
            ),
            Text("THE TASTE OF JAPANESE FOOD",style: GoogleFonts.dmSerifDisplay(
              fontSize: 50,
              color: Colors.white
            ),),
            SizedBox(height: 5,),
            Text("feel the taste of the most famous japanese food from anywhere",style: TextStyle(
              color: Colors.grey.shade300,
              height: 2
            ),),
            SizedBox(height: 10,),
            Button(text: "Get Started", onTap: (){
              Navigator.of(context).pushReplacementNamed("/menupage");
            })
          ],
        ),
      ),
    );
  }
}
