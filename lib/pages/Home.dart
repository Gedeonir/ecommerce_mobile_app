import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/SubmitBtn.dart';
import 'package:project_x/pages/homepage.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Homepage();
}

class _Homepage extends State<Home> {
  @override
  Widget build(BuildContext context) {

     double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
            Container(
              height: screenHeight,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      './lib/assets/BannerImage.png', // Replace with your image path
                      fit: BoxFit.cover, // Makes the image cover the screen
                    ),
                  ),

                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7), // Dark at the bottom
                            Colors.transparent, // Fully transparent at the top
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(  
                                      
                    child:Container(
                      width: 200,
                    child:Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 100,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Fashion Sale", 
                        style: TextStyle(color: AppColors.white, fontSize: 34, fontWeight: FontWeight.bold),),

                        SizedBox(height: 6,),
                        SubmitBtn(text: "Shop Now", press: (){}),
                      ],
                    )
                    )
                    )
                    )
                ],
              ),
            ),

            SizedBox(height: 20,),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("New", style: AppTextStyles.heading1),
                          SizedBox(height: 6,),
                          Text("You’ve never seen it before!", style: AppTextStyles.caption),

                        ],
                      ),

                      TextButton(
                        child: Text("View All", style: AppTextStyles.subHeads,),
                        onPressed: (){},
                      ),

                  ]
                  ),
                  SizedBox(height: 10,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("New Arrivals", style: AppTextStyles.heading1,),
                        Text("New Arrivals", style: AppTextStyles.heading1,),
                        Text("New Arrivals", style: AppTextStyles.heading1,),
                        Text("New Arrivals", style: AppTextStyles.heading1,)
                      ],
                    ),
                  )
                ]
              ),
            )
          ]
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
