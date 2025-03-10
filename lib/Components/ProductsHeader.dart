import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class ProductHeader extends StatelessWidget {
  final String title;
  final subTitle;
  final VoidCallback onViewAllPressed;

  const ProductHeader(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onViewAllPressed})
      : super(key: key);

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.descriptiveItem),
                SizedBox(
                  height: 6,
                ),
                Text(subTitle,
                    style: AppTextStyles.descriptionText),
              ],
            ),
          ),
         Expanded(
           
          child: TextButton(
            child:Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Text(
              "View All",
              style: AppTextStyles.descriptiveItem,
              ), 
            ),
           
            onPressed: onViewAllPressed,
          ), 
          )
        ]);
  }
}
