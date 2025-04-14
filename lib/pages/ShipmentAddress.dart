import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/addAddressModal.dart';

class Shipmentaddress  extends StatefulWidget{
  @override
  _ShipmentaddressState createState() => _ShipmentaddressState();
}

class _ShipmentaddressState extends State<Shipmentaddress> {
  List<String> Cards=['1','2','3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Header(title: 'Shipment Address'),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: Cards.map((item){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: AppColors.white,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text('IRAFASHA Gedeon',style: AppTextStyles.descriptiveItem,),

                                    GestureDetector(
                                      onTap: (){},
                                      child: Text('Edit',style: AppTextStyles.textLinks,)
                                    )
                                    
                                  ]),

                                  SizedBox(height: 15,),

                                  Text('3 Newbridge Court ',style: AppTextStyles.descriptionText,),
                                  Text('Chino Hills, CA 91709, United States',style: AppTextStyles.descriptionText,),
                                
                                  SizedBox(height: 15,),

                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: (){}, 
                                        icon: item == '1' ? Icon(Icons.check_box,color: AppColors.black,) : Icon(Icons.check_box_outline_blank,color: AppColors.gray,),
                                      ),
                                      Text('Use as the shipping address',style: AppTextStyles.descriptiveItem,)
                                    ],
                                  ),
                                ]
                              ),
                          ),
                        )
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ]
                      
        )
      ),
      floatingActionButton:Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.primary,
          label:  Text('Add Address',style: AppTextStyles.ButtonText,),
          icon: Icon(Icons.add,color: AppColors.white,),
          onPressed: (){_showAddAddressOverlay(context);},
        ),
      )
    );
                
  }


  void _showAddAddressOverlay(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // Dim the background
      transitionDuration: Duration(milliseconds: 300), // Transition speed
      pageBuilder: (context, animation, secondaryAnimation) {
        return addAddressModal();
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