import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Header.dart';

class OrdersList extends StatefulWidget{

  @override
  _OrderListState createState()=> _OrderListState();
}

class _OrderListState extends State<OrdersList> {

  String selectedOption = 'Delivered';
  List<String> options = ['Delivered', 'Pending', 'Cancelled'];

  void changeSection(String option) {
    setState(() {
      selectedOption = option;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(title: 'My Orders'),

            SizedBox(height: 1,),

            Expanded(
              child:SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: options.map((item){
                            return SizedBox(
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.only(left: 2, right: 2),
                                      decoration: BoxDecoration(
                                          color: item == selectedOption ? AppColors.black : null,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                      child: Text(
                                        item,
                                        style: item == selectedOption ? AppTextStyles.ButtonText : AppTextStyles.ButtonText2,
                                      ),
                                    ),
                                    SizedBox(width: 20,)
                                  ],
                                ),
                                onTap: () => changeSection(item),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      selectedOption == 'Delivered' ?
                      Column(
                        children: [
                          OrderCard(status: 'Delivered',),
                          OrderCard(status: 'Delivered',),
                          OrderCard(status: 'Delivered',),
                          OrderCard(status: 'Delivered',),
                          OrderCard(status: 'Delivered',),
                          OrderCard(status: 'Delivered',)
                        ],
                      )
                      :
                      selectedOption == 'Pending' ?
                      Column(
                        children: [
                          OrderCard(status: 'Pending',),
                          OrderCard(status: 'Pending',),
                          OrderCard(status: 'Pending',)
                      ])
                      :
                      OrderCard(status: 'Cancelled',),

                    ]
                  )
                ),
              ) 
            )
          ],
        ),
      ),
    );
  }
}


class OrderCard extends StatefulWidget{
  String status;

  OrderCard({required this.status});
  @override
  _OrderCardState createState()=> _OrderCardState();
}

class _OrderCardState extends State<OrderCard> { 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            // height: 200,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  offset: Offset(0, 1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Order №1947034',style: AppTextStyles.descriptiveItem,),
                  Text('June 12,2024',style: AppTextStyles.descriptionText,),
                ]),

                Row(
                  children: [
                    Text('Tracking number:',style: AppTextStyles.descriptionText,),
                    SizedBox(width: 5,),
                    Text('IW3475453455:',style: AppTextStyles.descriptiveItem,),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                      Text('Items:',style: AppTextStyles.descriptionText,),
                      SizedBox(width: 5,),
                      Text('3',style: AppTextStyles.descriptiveItem,),
                    ]),

                    Row(
                      children: [
                      Text('Total Amount:',style: AppTextStyles.descriptionText,),
                      SizedBox(width: 5,),
                      Text('\$121',style: AppTextStyles.descriptiveItem,),
                    ])
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){Navigator.pushReplacementNamed(context, '/my_profile/orders/details');},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          elevation: 0,
                          side: BorderSide(color: AppColors.black, width: 2), // Border
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                        
                        child: Text('Details',style: AppTextStyles.ButtonText2,),
                      ),

                      Text(widget.status,style: widget.status == 'Delivered' ? AppTextStyles.successText: widget.status == 'Pending' ? AppTextStyles.ButtonText2 : AppTextStyles.errorText,)

                    ],
                  )
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}