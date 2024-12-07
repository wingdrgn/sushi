import 'package:flutter/material.dart';
import 'package:sushi/theme/colors.dart';
import 'package:sushi/components/button.dart';

// class IntroPage extends StatefulWidget {
//   const IntroPage({super.key});

//   @override
//   State<IntroPage> createState() => IntroPgaeState();
// }

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Image.asset(
              'lib/images/intro_page_bg.png',
              fit: BoxFit.contain,
            ),
          ),
          const Positioned(
            left: 30,
            top: 0.0,
            bottom: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '日',
                  style: TextStyle(color: Colors.white, fontSize: 100.0),
                ),
                Text(
                  '本',
                  style: TextStyle(color: Colors.white, fontSize: 100.0),
                ),
                Text(
                  '食',
                  style: TextStyle(color: Colors.white, fontSize: 100.0),
                )
              ],
            ),
          ),
          Positioned(
            right: 30,
            top: 30,
            bottom: 150.0,
            child: Image.asset("lib/images/intro_page_chopsticks.png",
                width: 400, height: 400, fit: BoxFit.scaleDown),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Text(
                'SUSHIMAN',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'THE TASTE OF JAPANESE FOOD',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Feel the taste of the most delicious Japanese food in town, from anywhere and anytime',
                    style: TextStyle(height: 2, color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyButton(
                text: 'Get start!!!',
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
