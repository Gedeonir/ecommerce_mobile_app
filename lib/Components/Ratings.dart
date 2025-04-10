import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/ReviewCard.dart';

class Ratings extends StatefulWidget {
  @override
  _RatingsState createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RatingsData {
  final double rating;
  final int itemCount; 
  final double widthFactor;
  final int peoples;

  RatingsData({
    required this.widthFactor,
    required this.rating,
    required this.itemCount,
    required this.peoples
  });
}
