import 'package:flutter/material.dart';
import 'package:project_x/Components/AppStyles.dart';

class Ratings extends StatefulWidget{

  @override
  _RatingsState createState()=>_RatingsState();
}

class _RatingsState extends State<Ratings>{

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Ratings & Review",style: AppTextStyles.heading1,),

          SizedBox(height: 20,),

          

        ],
      ),
    );
  }
  
}