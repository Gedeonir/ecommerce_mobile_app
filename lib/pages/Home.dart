import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/CategoriesCard.dart';
import 'package:project_x/Components/ProductsHeader.dart';
import 'package:project_x/Components/SubmitBtn.dart';
import 'package:project_x/Components/productCard.dart';

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
          child: Column(children: [
            Container(
              height: screenHeight,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.network(
                      'https://res.cloudinary.com/gedeoncloud/image/upload/v1741595796/ecomerce/BannerImage_uqs9md.png', // Replace with your image path
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image, size: 50, color: Colors.red);
                      },
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
                      child: Container(
                          width: 200,
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Fashion Sale",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SubmitBtn(text: "Check Now", press: () {}),
                                ],
                              ))))
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductHeader(
                      title: "New",
                      subTitle: "You’ve never seen it before!",
                      onViewAllPressed: () {}
                    ),

                    SizedBox(
                      height: 10,
                    ),
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
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.network(
                      'https://res.cloudinary.com/gedeoncloud/image/upload/v1741610015/ecomerce/pexels-photo-911677_qdxngz.png', // Replace with your image path
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image, size: 50, color: Colors.red);
                      },
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
                      child: Container(
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Street clothes",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 150,
                                    child: SubmitBtn(
                                        text: "Check Now", press: () {}),
                                  )
                                ],
                              ))))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductHeader(
                        title: "Hot Sale",
                        subTitle: "Super summer sale",
                        onViewAllPressed: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width:200, 
                            
                            child: ProductCard(
                                imageUrl:
                                    "https://res.cloudinary.com/gedeoncloud/image/upload/v1741601864/ecomerce/shoes_b1lwii.jpg",
                                title: "Jordan 3, White Sliver",
                                description:
                                    "Air Jordan: The Legacy of a Sneaker Icon",
                                price: 40,
                                rating: 4.5,
                                onFavoritePressed: () {},
                                newLabel: false,
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
                                newLabel: false,
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
                                newLabel: false,
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
                              newLabel: false,
                              noLabel:false
                            ),
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
                              newLabel: false,
                              noLabel:false
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductHeader(
                          title: "Categories",
                          subTitle: "Check out our categories",
                          onViewAllPressed: () {}),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CategoriesCard(image: "https://res.cloudinary.com/gedeoncloud/image/upload/v1741614594/ecomerce/image_4_d3n1j3.png", caption: "New collection"),
                          CategoriesCard(image: "https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/Jordan_3_Black_kjsjsk.jpg", caption: "Shoes"),
                          CategoriesCard(image: "https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png", caption: "Hoodies"),
                          CategoriesCard(image: "https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_1_tpakmp.png", caption: "Shades"),

                        ],
                      )
                    ]))
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
