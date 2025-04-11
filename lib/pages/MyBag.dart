import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/ProductCard2.dart';
import 'package:project_x/Components/PromoOverlay.dart';

class MyBag extends StatefulWidget{
  @override
  _MyBagState createState()=>_MyBagState();
}

class _MyBagState extends State<MyBag>{

  List<Products> products=[
    Products(
      id:1,
      color: 'black', 
      title: 'Shades',
      unitPrice: 50.2, 
      price:50.2,
      imgUrl: 'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_1_tpakmp.png',
      brand: 'Adidas'
    ),
    Products(
      id:2,
      color: 'White', 
      title: 'T-Shirt sailing',
      unitPrice: 10.9, 
      price:10.9,
      imgUrl: 'https://res.cloudinary.com/gedeoncloud/image/upload/v1741601941/ecomerce/image_dylgam.png',
      brand: 'Adidas'
    ),
    Products(
      id:3,
      color: 'White Sliver', 
      title: 'Air Jordan 3',
      unitPrice: 40.5, 
      price:40.5,
      imgUrl: 'https://res.cloudinary.com/gedeoncloud/image/upload/v1741601864/ecomerce/shoes_b1lwii.jpg',
      brand: 'Nike'
    )
  ];

  void updateProductPrice(int id,int items){
    final index =products.indexWhere((item)=>item.id==id);
    setState(() {
      products[index].price=items*products[index].unitPrice;
    });
  }
  


  @override
  Widget build(BuildContext contex){

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
                      Text("My Bag",style: AppTextStyles.subHeads,),
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
                child:SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: products.map((item){
                        return ProductCard2(
                          id: item.id,
                          title: item.title,
                          price: item.price,
                          brand: item.brand,
                          color: item.color,
                          imgUrl: item.imgUrl,
                          updateProductPrice:(int items)=> updateProductPrice(item.id, items),
                        );

                      }).toList() 
                    ),

                    //promocode
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(22),bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.1),
                                    offset: Offset(0, 1),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),

                              child: Text('Choose your promocode',style: AppTextStyles.descriptionText,),

                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.black,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    size: 20,
                                    color: AppColors.white,
                                  ),
                                  onPressed: () {
                                    _showPoromoOptionsOverlay(context);
                                  },
                                ),
                              ),
                            )
                          
                          ]
                        ),


                        
                      ]
                    )
                    ),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total amount',style: AppTextStyles.descriptionText,),
                          Text('\$${products.map((item) => item.price).reduce((a, b) => a + b).toStringAsFixed(2)}',style: AppTextStyles.subHeads,),
                        
                        ]
                      ),
                    )
                  ],
                )
               
                )
              ),

            

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigation(),
    );
  }

  void _showPoromoOptionsOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PromosOverlay(
          currentOption: '',
        );
      },
    );
  }
}


class Products{
  String color;
  String title;
  double price;
  String imgUrl;
  String brand;
  double unitPrice;
  int id;

  Products({required this.id, required this.color, required this.title, required this.price,required this.imgUrl,required this.brand,required this.unitPrice});
  
}