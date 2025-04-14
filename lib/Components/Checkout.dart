import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/SubmitBtn.dart';


class Checkout extends StatefulWidget {
  final double orderPrice;
  final double deliveryFee;
  final double payableFee;

  Checkout({required this.orderPrice,required this.deliveryFee,required this.payableFee});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        width: double.infinity,
        child: Column(
          children: [
            Header(title: 'Checkout'),

            Expanded(
              child:SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Shipping Address',style: AppTextStyles.subHeads,),
                    SizedBox(height: 10,),

                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.1),
                            offset: Offset(0, 1),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)

                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('IRAFASHA Gedeon', style: AppTextStyles.descriptiveItem,),
                                SizedBox(height: 10,),

                                Text('Nyarugenge,Kigali', style: AppTextStyles.descriptionText,),
                                Text('Kimisagara,Cyove,KN 200 ST', style: AppTextStyles.descriptionText,)

                              ],
                            ),

                            SizedBox(width: 10,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: Text('Change',style: AppTextStyles.textLinks,),

                                )
                              ]
                              
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),


                    Text('Payement',style: AppTextStyles.subHeads,),
                    SizedBox(height: 10,),

                    Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child:Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.1),
                              offset: Offset(0, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)

                        ),

                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:50,
                                  width:80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage('https://res.cloudinary.com/gedeoncloud/image/upload/v1744477423/MTN-Momo-e1584721116128_maipwy.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 10,),

                                Text('********38', style: AppTextStyles.descriptiveItem,)
                              ],
                            ),

                            GestureDetector(
                              onTap: (){},
                              child: Text('Change',style: AppTextStyles.textLinks,),
                            )
                            
                          ],
                        ) ,
                      ),
                    ),

                    SizedBox(height: 20,),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Order:',style: AppTextStyles.subHeads2,),
                            Text('\$'+ widget.orderPrice.toString(),style: AppTextStyles.subHeads,)
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery fee:',style: AppTextStyles.subHeads2,),
                            Text('\$'+ widget.deliveryFee.toString(),style: AppTextStyles.subHeads,)
                          ],
                        ),

                        SizedBox(height: 20,),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total payable amount:',style: AppTextStyles.subHeads2,),
                            Text('\$'+ (widget.orderPrice+widget.deliveryFee).toString(),style: AppTextStyles.subHeads,)
                          ],
                        ),

                        SizedBox(height: 5,),


                        
                      ],
                    ),

                    SizedBox(height: 20,),

                    SubmitBtn(text: 'Submit order', press: (){_showCheckoutOverlay(context);})
                    
                  ]
                ),
              )
              )
            )
          ],
        ),
      )
    );
  }

  void _showCheckoutOverlay(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // Dim the background
      transitionDuration: Duration(milliseconds: 300), // Transition speed
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                image: NetworkImage('https://res.cloudinary.com/gedeoncloud/image/upload/v1744480841/124de3d1b5e12f1d8fcec1685e634361_z98w8z.gif'),
                fit: BoxFit.cover,
              ),
            ),
            child:SingleChildScrollView(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://res.cloudinary.com/gedeoncloud/image/upload/v1744482535/cute-happy-funny-shopping-bags-cartoon-character-illustration-icon-design-isolated_92289-1087_rd80jz.jpg'), 
                      fit: BoxFit.cover
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Text('Success!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.black),),
                SizedBox(height: 10,),

                Text('Your order will be delivered soon.\nThank you for shooping with us!', 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.black),
                ),

                SizedBox(height: 50,),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SubmitBtn(text: 'Continue Shopping', press: (){Navigator.pushReplacementNamed(context, '/shop_now');},),
                )

              ],
            )
            )
          )
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