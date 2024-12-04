import 'package:flutter/material.dart';

import 'package:sushi/models/filter.dart';

class FilterTitle extends StatelessWidget {
  final Filter filter;
  final void Function()? onTap;

  const FilterTitle({super.key, required this.filter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              filter.imagePath,
              height: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              filter.name,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
