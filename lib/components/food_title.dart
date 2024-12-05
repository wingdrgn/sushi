import 'package:flutter/material.dart';

import 'package:sushi/models/food.dart';
import 'package:sushi/theme/colors.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTitle({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 190,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Image.asset(food.imagePath, width: 120, height: 120),
                const SizedBox(height: 20),
                Text(
                  food.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star,
                            color: primaryColor,
                          ),
                          Text(
                            food.rating,
                            style: const TextStyle(fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 12,
            right: 30,
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
