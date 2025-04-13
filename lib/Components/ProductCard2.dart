import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class ProductCard2 extends StatefulWidget {
  final String title;
  final String color;
  final String brand;
  final double price;
  final String imgUrl;
  final int id;
  final ValueChanged<int> updateProductPrice;
  final bool isIncrementVisible;

  ProductCard2({
    required this.title,
    required this.color,
    required this.brand,
    required this.price,
    required this.id,
    required this.imgUrl,
    required this.updateProductPrice,
    required this.isIncrementVisible
  });

  _ProductCard2State createState() => _ProductCard2State();
}

class _ProductCard2State extends State<ProductCard2> {

  int itemsCount=1;

  void incrementItems(){
    setState(() {
      itemsCount +=1;
    });

    widget.updateProductPrice(itemsCount);
  }

  void decrementItems(){
    setState(() {
      itemsCount -=1;
    });

    widget.updateProductPrice(itemsCount);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            //padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  offset: Offset(0, 1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),

            child: Row(
              children: [
                Container(
                  height:
                      160, // or MediaQuery.of(context).size.height for full screen height
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(widget.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: AppTextStyles.subHeads,
                          ),

                          widget.isIncrementVisible ? 
                            IconButton(
                              onPressed: (){}, 
                              icon:Icon(
                                Icons.more_vert,
                                size: 25,
                                color: AppColors.gray,
                              )
                            )
                          :
                          Text('')
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Color:',
                            style: AppTextStyles.descriptionText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.color,
                            style: AppTextStyles.caption,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Size:',
                            style: AppTextStyles.descriptionText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Large',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Brand:',
                            style: AppTextStyles.descriptionText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.brand,
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.isIncrementVisible
                          ?
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape
                                        .circle, // Ensure the shadow is circular
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black
                                            .withOpacity(0.1), // Shadow color
                                        offset: Offset(
                                            0, 1), // Shadow position (x, y)
                                        blurRadius: 10, // Shadow blur radius
                                        spreadRadius: 4, // Spread radius
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: itemsCount >1?AppColors.white:AppColors.background,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: AppColors.gray,
                                      ),
                                      onPressed: itemsCount >1? () {
                                        decrementItems();
                                      }:null,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    itemsCount.toString(),
                                    style: AppTextStyles.descriptiveItem,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape
                                        .circle, // Ensure the shadow is circular
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.black
                                            .withOpacity(0.1), // Shadow color
                                        offset: Offset(
                                            0, 1), // Shadow position (x, y)
                                        blurRadius: 10, // Shadow blur radius
                                        spreadRadius: 4, // Spread radius
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.white,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: AppColors.gray,
                                      ),
                                      onPressed: () {
                                        incrementItems();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                          :
                          Container(
                            child: Row(
                              children: [
                                Text('Units: ', style: AppTextStyles.descriptionText,),
                                Text(
                                  itemsCount.toString(),
                                  style: AppTextStyles.descriptiveItem,
                                ),
                              ],
                            )
                            
                          ),

                          Container(
                            child: Text(
                              '\$'+widget.price.toStringAsFixed(2),
                              style: AppTextStyles.subHeads,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
