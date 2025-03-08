import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class SubmitBtn extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const SubmitBtn({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            text,
            style: AppTextStyles.ButtonText,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(double.infinity, 50)),
        ));
  }
}
