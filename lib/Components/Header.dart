import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class Header extends StatefulWidget {
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 20,
                color: AppColors.black,
              ),
              onPressed: () {
                Navigator.pop(
                    context); // Pops the current screen off the stack to go back
              },
            ),
            Text(
              "Men's Shorts",
              style: AppTextStyles.subHeads,
            ),
          ],
        ),
      ),
    );
  }
}
