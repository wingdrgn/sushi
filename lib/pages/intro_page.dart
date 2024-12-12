import 'package:flutter/material.dart';
import 'package:sushi/theme/colors.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sushi/components/animate.dart';
import 'package:sushi/components/custom_route.dart';
import 'package:sushi/pages/menu_page.dart';

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
                ),
              ],
            ),
          ),
          const Positioned(
            right: 30,
            top: 30,
            bottom: 150.0,
            child: Animate(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Text(
                AppLocalizations.of(context)!.sushiman,
                style: const TextStyle(fontSize: 28, color: Colors.white),
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
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      page: const MenuPage(),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.elasticInOut,
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: const EdgeInsets.only(top: 50, right: 25),
              onPressed: () {
                context.read<LanguageProvider>().toggleLanguage();
              },
              icon: const Icon(Icons.language),
            ),
          ),
        ],
      ),
    );
  }
}
