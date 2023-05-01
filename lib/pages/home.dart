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
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/root");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 4, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(6)),
                      child: Text("Next", style: TextStyle(
                        fontSize: 50,
                        color:Colors.white, background: Paint()..color
                      ),),
                      ),
                  )
                ),
            ),
          ],
        )
      );
  }
}
