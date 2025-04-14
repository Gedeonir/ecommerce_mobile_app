import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/FilterModal.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/ProductCard.dart';
import 'package:project_x/Components/SortingModal.dart';

class Productlist extends StatefulWidget {
  _ProductlistState createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  String selectedOption = 'Price: Low to High';
  String selectedColor='black';
  String Category='All';

  void updateSelectedOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void updateCategory(String category){
    setState(() {
      Category=category;
    });
  }

  // Initial price range (min, max)
  double minPrice = 0.0;
  double maxPrice = 1000.0;

  // The selected price range
  double currentMinPrice = 0.0;
  double currentMaxPrice = 1000.0;

  // Slider range values
  final double minSliderValue = 0.0;
  final double maxSliderValue = 1000.0;


  void updatePricesRange(RangeValues values) {
    setState(() {
      currentMinPrice = values.start;
      currentMaxPrice = values.end;
    });
  }

  void updateColors(String color){
    setState(() {
      selectedColor=color;
    });
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600
        ? 4 // 3 columns on larger screens
        : 2; // 2 columns on smaller screens

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: "Men's Shoes",
            ),
            
            SizedBox(height: 1,),

            Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showSortOptionsOverlay(context);
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.sort,
                                      size: 20, color: AppColors.black),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Sort by:',
                                    style: AppTextStyles.caption,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    selectedOption,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors
                                          .primary, // Using the custom black color
                                      letterSpacing: 0,
                                    ),
                                  )
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showFilterOptionsOverlay(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Row(
                              children: [
                                Icon(Icons.filter_list,
                                    size: 20, color: AppColors.black),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Filter',
                                  style: AppTextStyles.caption,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                            description:
                                "Air Jordan: The Legacy of a Sneaker Icon",
                            price: 40,
                            rating: 4.5,
                            onFavoritePressed: () {},
                            newLabel: true,
                            noLabel: true,
                          ));
                    },
                  )),
            )
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
            onOptionSelected: updateSelectedOption);
      },
    );
  }

  void _showFilterOptionsOverlay(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // Dim the background
      transitionDuration: Duration(milliseconds: 300), // Transition speed
      pageBuilder: (context, animation, secondaryAnimation) {
        return FilterModal(
            maxPrice: maxPrice,
            minPrice: minPrice,
            currentMaxPrice: currentMaxPrice,
            currentMinPrice: currentMinPrice,
            maxSliderValue: maxSliderValue,
            minSliderValue: minSliderValue,
            onPricesChanged:updatePricesRange,

            color: selectedColor,
            onColorChange: updateColors,

            category: Category,
            onCategoryChange: updateCategory,
            
            );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Set the offset for sliding in from the right
        const begin = Offset(1.0, 0.0); // Start from the right side
        const end = Offset.zero; // End at the center

        // Set the curve for the animation
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
