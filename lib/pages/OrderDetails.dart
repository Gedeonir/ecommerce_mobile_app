import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/ProductCard2.dart';
import 'package:project_x/Components/SubmitBtn.dart';
import 'package:project_x/pages/MyBag.dart';

class OrderDetails extends StatefulWidget{

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String status = 'Delivered';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(title: 'Order Details'),

            Expanded(
              child:SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('Order №1947034',style: AppTextStyles.descriptiveItem,),
                              Text('June 12,2024',style: AppTextStyles.descriptionText,),
                            ]),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                  Text('Tracking number:',style: AppTextStyles.descriptionText,),
                                  SizedBox(width: 5,),
                                  Text('IW3475453455:',style: AppTextStyles.descriptiveItem,),
                                ]),

                                Text(status,style: status == 'Delivered' ? AppTextStyles.successText: status == 'Pending' ? AppTextStyles.ButtonText2 : AppTextStyles.errorText,)

                              ],
                            ),

                            Row(
                              children: [
                              Text('Items:',style: AppTextStyles.descriptionText,),
                              SizedBox(width: 5,),
                              Text('3',style: AppTextStyles.descriptiveItem,),
                            ]),
                          ],
                        ),
                      ),

                      Column(
                        children: products.map((item){
                          return ProductCard2(
                            id: item.id,
                            title: item.title,
                            price: item.price,
                            brand: item.brand,
                            color: item.color,
                            imgUrl: item.imgUrl,
                            updateProductPrice:(int items){},
                            isIncrementVisible: false
                          );

                        }).toList() 
                      ),
                      

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Purchase order information',style: AppTextStyles.subHeads,),

                            SizedBox(height: 20,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 150,
                                  child:  Text('Shipping address:',style: AppTextStyles.subHeads2,),
                                ),

                                SizedBox(width: 5,),

                                Expanded(
                                  child:Text('3 Newbridge Court ,Chino Hills, CA 91709, United States',style: AppTextStyles.subHeads,softWrap: true,overflow: TextOverflow.visible,),
                                )
                              ],
                            ),

                            SizedBox(height: 15,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 150,
                                  child: Text('Payment method:',style: AppTextStyles.subHeads2,),
                                ),

                                SizedBox(width: 5,),
                                Expanded(
                                  child:Row(
                                    children: [
                                      Container(
                                        height:20,
                                        width:30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: NetworkImage('https://res.cloudinary.com/gedeoncloud/image/upload/v1744477423/MTN-Momo-e1584721116128_maipwy.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10,),

                                      Text('**** *** **38', style: AppTextStyles.subHeads,)
                                    ],
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 15,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 150,
                                  child:Text('Delivery method: ',style: AppTextStyles.subHeads2,),
                                ),

                                SizedBox(width: 5,),
                                Expanded(
                                  child:Text('Bike,2 hours, \$15',style: AppTextStyles.subHeads,softWrap: true,overflow: TextOverflow.visible,),
                                )
                              ],
                            ),

                            SizedBox(height: 15,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 150,
                                  child: Text('Discount: ',style: AppTextStyles.subHeads2,),
                                ),

                                SizedBox(width: 5,),
                                Expanded(
                                  child:Text('\$10%, Festive seasons promotion',style: AppTextStyles.subHeads,softWrap: true,overflow: TextOverflow.visible,),
                                )
                              ],
                            ),

                            SizedBox(height: 15,),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 150,
                                  child:Text('Total amount: ',style: AppTextStyles.subHeads2,),
                                ),
                                
                                SizedBox(width: 5,),
                                Expanded(
                                  child:Text('\$100',style: AppTextStyles.subHeads,softWrap: true,overflow: TextOverflow.visible,),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(onPressed: (){Navigator.pushReplacementNamed(context, '/my_profile/orders/details');},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 50),
                                  backgroundColor: AppColors.background,
                                  elevation: 0,
                                  side: BorderSide(color: AppColors.black, width: 2), // Border
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                
                                ),
                                
                                child: Text('Reorder',style: AppTextStyles.ButtonText2,),
                              )
                            ),
                            SizedBox(width: 30,),
                            Expanded(child:SubmitBtn(text: 'Leave feedback', press: (){},),)
                          ],
                        )
                      )


                    ],
                  )
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