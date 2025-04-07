import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/ProductCard.dart';
import 'package:project_x/Components/SortingModal.dart';

class Productlist extends StatefulWidget {
  _ProductlistState createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {

  String selectedOption = 'Price: Low to High';

  void updateSelectedOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600
    ? 3 // 3 columns on larger screens
    : 2; // 2 columns on smaller screens

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Header(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                color: AppColors.white,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                          SizedBox(
                              child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              'Casual',
                              style: AppTextStyles.ButtonText,
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        GestureDetector(
                          onTap: (){_showSortOptionsOverlay(context);},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal:5 ),

                            child: Row(
                              children: [
                                Icon(
                                Icons.sort,
                                size: 20,
                                color: AppColors.black
                                ),

                                SizedBox(width: 5,),

                                Text('Sort by:',style: AppTextStyles.subHeads,),

                                SizedBox(width: 5,),

                                Text(selectedOption,style: AppTextStyles.activeSort,)

                              ],
                            )
                          ),
                        )
                      ],
                    )
                  ],
                )),
                
                SizedBox(height: 5,),

            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 5,
                mainAxisSpacing: 3,
                childAspectRatio: 0.7,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return AspectRatio(
                    aspectRatio:
                        0.7, // This ensures that the card maintains a consistent aspect ratio
                    child: ProductCard(
                        imageUrl:
                            "https://res.cloudinary.com/gedeoncloud/image/upload/v1741601864/ecomerce/shoes_b1lwii.jpg",
                        title: "Jordan 3, White Sliver",
                        description: "Air Jordan: The Legacy of a Sneaker Icon",
                        price: 40,
                        rating: 4.5,
                        onFavoritePressed: () {},
                        newLabel: true,
                        noLabel: true,));
              },
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  void _showSortOptionsOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SortOptionsOverlay(
          currentOption: selectedOption,
          onOptionSelected: updateSelectedOption
        );
      },
    );
  }
}
