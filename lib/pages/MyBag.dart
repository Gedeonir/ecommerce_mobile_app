import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Checkout.dart';
import 'package:project_x/Components/ProductCard2.dart';
import 'package:project_x/Components/PromoOverlay.dart';
import 'package:project_x/Components/SubmitBtn.dart';

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

  int selectedOption=0;
  String selectedPromo='';
  double discountOffer=0;


  void onPromoOptionSelected(int id){
    setState((){
      selectedOption=id;
    });
  }

  void onPromoOptionChange(String title){
    setState((){
      selectedPromo=title;
    });
  }

  void applyDiscount(double discount){
    setState((){
      discountOffer=discount;
    });
  }

  double getTotalPrice(){
  return products.map((item) => item.price).reduce((a, b) => a + b) * (1-discountOffer);
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
                          isIncrementVisible: true
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

                              child: Text(selectedPromo==''?'Choose your promocode':selectedPromo,style: AppTextStyles.descriptionText,),

                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: selectedPromo==''?
                              CircleAvatar(
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
                              )
                              :

                              Padding(
                                padding: EdgeInsets.all(2),
                                child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.close,
                                  size: 22,
                                  color: AppColors.gray,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedOption=0;
                                    selectedPromo='';
                                    discountOffer=0;
                                  });
                                },
                              )
                              )
                              ,
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
                          Text('Total amount',style: AppTextStyles.subHeads2,),
                          Text('\$${getTotalPrice().toStringAsFixed(2)}',style: AppTextStyles.subHeads,),
                        
                        ]
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(20),
                      child: SubmitBtn(text: 'Proceed to checkout', press: (){_showCheckoutOverlay(context);},),
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
          currentOption: selectedOption,
          onOptionSelected: onPromoOptionSelected,
          onOptionChange: onPromoOptionChange,
          selectedPromo: selectedPromo,
          discount: discountOffer,
          handleDiscount: applyDiscount,
        );
      },
    );
  }

  void _showCheckoutOverlay(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // Dim the background
      transitionDuration: Duration(milliseconds: 300), // Transition speed
      pageBuilder: (context, animation, secondaryAnimation) {
        return Checkout(
          orderPrice:getTotalPrice(),
          deliveryFee: 12.0,
          payableFee: 0.0,
          
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