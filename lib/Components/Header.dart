import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class Header extends StatefulWidget {
  final String title;

  Header({required this.title});
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]
        ),
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
              widget.title,
              style: AppTextStyles.subHeads,
            ),
          ],
        ),
      );
  }
}
