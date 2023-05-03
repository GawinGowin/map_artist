import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home.png"),
                fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(vertical: 130),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/root");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.blueAccent.shade700, width: 6, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(6)),
                      child: const Text("START", style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold ,
                        letterSpacing: 5.0,
                        color:Colors.white,
                      ),
                      ),),
                      ),
                  )
                ),
          ],
        )
      );
  }
}
