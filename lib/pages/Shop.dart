import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';


class Shop extends StatefulWidget{
  @override
  State<Shop> createState()=> _ShopWidget();
  
}

class _ShopWidget extends State<Shop>{
  final List<String> categories=[
    "Shorts",
    "Jeans",
    "Shoes",
    "Dresses",
    "Tops",
    "T-shirt & Bolouses",
    "Knitwear",
    "Shorts",
    "Jeans",
    "Shoes",
    "Dresses",
    "Tops",
    "T-shirt & Bolouses",
    "Knitwear",
  ];

  @override
  Widget build(BuildContext context){
      return Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // IconButton(
                      //   icon: Icon(Icons.chevron_left, size: 20, color: AppColors.black,),
                      //   onPressed: () {
                      //     Navigator.pop(context);  // Pops the current screen off the stack to go back
                      //   },
                      // ),


                      Text("Pick category",style: AppTextStyles.subHeads,),
                    ],
                  ),

                  IconButton(
                  icon: Icon(Icons.search, size: 20, color: AppColors.black,),
                  onPressed: () {
                  },
                  ),
                ],
              ),
              ),
              ),

              Expanded(
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child:ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 0,
                      color: AppColors.background,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          )
                        ),
                      child: GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context,'/shop_now/products'),
                      child:ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: Text(categories[index][0], style: AppTextStyles.caption,),
                        ),
                        title: Text(categories[index], style: AppTextStyles.subHeads,),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    )),
                    );
                  }
                )
                
              )
              )
            ],
          )
        ),

        bottomNavigationBar: BottomNavigation(),

      );
  }
}