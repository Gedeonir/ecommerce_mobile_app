import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class Screensheader extends StatelessWidget {
  final String title;

  Screensheader({required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.subHeads,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: 20,
                color: AppColors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
