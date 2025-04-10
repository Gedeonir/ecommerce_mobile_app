import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/ProductCard.dart';
import 'package:project_x/Components/Ratings.dart';
import 'package:project_x/Components/ReviewCard.dart';
import 'package:project_x/Components/SubmitBtn.dart';

class ViewOneProduct extends StatefulWidget {
  _ViewOneProductState createState() => _ViewOneProductState();
}

class _ViewOneProductState extends State<ViewOneProduct> {
  String selectedOption = 'Size';

  List<String> options = ['Size', 'Option 1', 'Option 2', 'Option 3'];

  List<RatingsData> ratings = [
    RatingsData(rating: 5.0,itemCount: 5,widthFactor: 1,peoples: 18),
    RatingsData(rating: 4.0,itemCount: 4,widthFactor: 0.8,peoples: 10),
    RatingsData(rating: 3.0,itemCount: 3,widthFactor: 0.6,peoples: 4),
    RatingsData(rating: 2.0,itemCount: 2,widthFactor: 0.4,peoples: 2),
    RatingsData(rating: 1.0,itemCount: 1,widthFactor: 0.2,peoples: 4)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 50,
                color: AppColors.white,
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Header(title: "Product name"),
                    Icon(
                      Icons.share,
                      color: AppColors.black,
                    )
                  ],
                )),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.network(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.network(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.network(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )),

                  //End of banner

                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.gray,
                                  width: 0.5,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedOption,
                                  icon: Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: AppTextStyles.subHeads,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedOption = newValue!;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: AppTextStyles.subHeads,
                                      ),
                                    );
                                  }).toList(),
                                  dropdownColor: AppColors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.gray,
                                  width: 0.5,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedOption,
                                  icon: Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: AppTextStyles.subHeads,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedOption = newValue!;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: AppTextStyles.subHeads,
                                      ),
                                    );
                                  }).toList(),
                                  dropdownColor: AppColors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape
                                    .circle, // Ensure the shadow is circular
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black
                                        .withOpacity(0.1), // Shadow color
                                    offset:
                                        Offset(0, 1), // Shadow position (x, y)
                                    blurRadius: 10, // Shadow blur radius
                                    spreadRadius: 1, // Spread radius
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.white,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                    color: AppColors.gray,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("H&H",style: AppTextStyles.heading1,),
                                Text("Long slevess yellow hoodie",style: AppTextStyles.descriptionText,),
                                SizedBox(height: 4,),
                                RatingBarIndicator(
                                  rating: 3.2,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 16,
                                ),

                              ],
                            ),

                            Text("\$ 199.99",style: AppTextStyles.heading1,),
                          ],
                        )
                        ,),

                        SizedBox(height: 10,),
                        Text("Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed",style: AppTextStyles.subHeads,),
                        SizedBox(height: 20,),

                        SubmitBtn(text: 'Add to bag', press: (){}),

                        SizedBox(height: 20,),

                        //Ratings and review
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Ratings & Review",
                                style: AppTextStyles.heading1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Based on 20+ Ratings',
                                        style: AppTextStyles.descriptionText,
                                      )
                                    ],
                                  ),

                                  SizedBox(width: 10),

                                  Expanded(
                                    child: Column(
                                      children:ratings.map((item){
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 80,
                                              alignment: Alignment.centerRight,
                                              child: RatingBarIndicator(
                                              rating: item.rating,
                                              itemBuilder: (context, index) => const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: item.itemCount,
                                              itemSize: 15.0,
                                            ),
                                            ),
                                            

                                            SizedBox(width: 5),

                                            Expanded(
                                              child: Container(
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: FractionallySizedBox(
                                                  alignment: Alignment.centerLeft,
                                                  widthFactor:item.widthFactor, 
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(width: 5),

                                            Text('${item.peoples}', style: AppTextStyles.descriptionText),
                                          ],
                                        );
                                      
                                      }).toList(),
                                    
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 20,),

                              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                child:Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text('20 Review', style: AppTextStyles.subHeads,),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Text('View All Reviews', style:AppTextStyles.textLinks ,),
                                  )
                                ])
                              ),

                            ReviewCard(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //Similar Products
                  Container(
                    width: double.infinity,
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You may also like",style: AppTextStyles.subHeads,),
                          SizedBox(height: 20,),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:200, // Ensure each ProductCard has a fixed width
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
                                      noLabel:false
                                      ),
                                ),

                                SizedBox(width: 10), // Add spacing between cards
                                SizedBox(
                                  width: 200,
                                  child: ProductCard(
                                      imageUrl:
                                          "https://res.cloudinary.com/gedeoncloud/image/upload/v1741601941/ecomerce/image_dylgam.png",
                                      title: "T-Shirt sailing",
                                      description: "Mango Boy",
                                      price: 60,
                                      rating: 4.8,
                                      onFavoritePressed: () {},
                                      newLabel: true,
                                      noLabel:false),
                                ),

                                SizedBox(width: 10), // Add spacing between cards
                                SizedBox(
                                  width: 200,
                                  child: ProductCard(
                                      imageUrl:
                                          "https://res.cloudinary.com/gedeoncloud/image/upload/v1741601864/ecomerce/image1_i58pwr.png",
                                      title: "Blouse",
                                      description: "OVS",
                                      price: 60,
                                      rating: 4.8,
                                      onFavoritePressed: () {},
                                      newLabel: true,
                                      noLabel:false),
                                ),

                                SizedBox(width: 10), // Add spacing between cards
                                SizedBox(
                                  width: 200,
                                  child: ProductCard(
                                      imageUrl:
                                          "https://res.cloudinary.com/gedeoncloud/image/upload/v1741601941/ecomerce/image_dylgam.png",
                                      title: "T-Shirt sailing",
                                      description: "Mango Boy",
                                      price: 60,
                                      rating: 4.8,
                                      onFavoritePressed: () {},
                                      newLabel: true,
                                      noLabel:false),
                                ),

                                SizedBox(width: 10), // Add spacing between cards
                                SizedBox(
                                  width: 200,
                                  child: ProductCard(
                                      imageUrl:
                                          "https://res.cloudinary.com/gedeoncloud/image/upload/v1741601864/ecomerce/image1_i58pwr.png",
                                      title: "Blouse",
                                      description: "OVS",
                                      price: 60,
                                      rating: 4.8,
                                      onFavoritePressed: () {},
                                      newLabel: true,
                                      noLabel:false),
                                ),
                              ],
                            ),
                          )
                      


                            ],
                          ),
                        )
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
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
