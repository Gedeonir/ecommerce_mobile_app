import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/SubmitBtn.dart';

class PromosOverlay extends StatelessWidget{

  final String currentOption;
  // final ValueChanged<String> onOptionSelected;

const PromosOverlay({
    Key? key,
    required this.currentOption,
    // required this.onOptionSelected,/
  }) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    List<Promotion> sortingCategories=[
      Promotion(
        title: 'Summer promotion', 
        description: 'Summer promotion', 
        image: 'https://res.cloudinary.com/gedeoncloud/image/upload/v1744389933/pngtree-up-to-20-off-price-tag-design-png-image_6429660_j0pj4g.png', 
        isValid: true, 
        expirationDate: 'September 31,2025', 
        percentageOff: 20
      ),

      Promotion(
        title: 'Festive seasons Promo', 
        description: 'New year promotion', 
        image: 'https://res.cloudinary.com/gedeoncloud/image/upload/v1744393539/pngtree-30-off-price-reduction-discount-png-image_368032_b2jdt8.jpg', 
        isValid: true, 
        expirationDate: 'January 31,2026', 
        percentageOff: 30
      ),

      Promotion(
        title: 'Festive seasons Promo', 
        description: 'New year promotion', 
        image: 'https://res.cloudinary.com/gedeoncloud/image/upload/v1744393539/pngtree-30-off-price-reduction-discount-png-image_368032_b2jdt8.jpg', 
        isValid: false, 
        expirationDate: 'January 31,2025', 
        percentageOff: 30
      ),
      
    ];


    return GestureDetector(
      onTap: ()=> Navigator.of(context).pop(),
      child: Container(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedPadding(
            padding: EdgeInsets.all(0), 
            duration: Duration(milliseconds: 300),
            child: Material(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.gray,

                      ),
                    ),

                    SizedBox(height: 20,),

                    Text('Your Promos Code',style: AppTextStyles.subHeads,),

                    Expanded(
                      child: ListView.builder(
                      itemCount: sortingCategories.length,
                      itemBuilder: (context, index) {
                        final item = sortingCategories[index];

                        return Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
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
                                    150, // or MediaQuery.of(context).size.height for full screen height
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(item.title,style: AppTextStyles.descriptiveItem,),
                                          SizedBox(height: 5,),
                                          Text(item.description, style: AppTextStyles.descriptionText,),
                                        
                                          SizedBox(height: 10,),

                                          Text(item.isValid? 'Offer valid until June 20, 2025':'Offer Expired on June 20, 2025',style: item.isValid? AppTextStyles.descriptionText:AppTextStyles.errorText,),
                                          SizedBox(height: 5,),
                                          item.isValid?
                                          SizedBox(width:150, child: SubmitBtn(text: 'Apply', press: (){}),)
                                          : Container(),
                                        ],
                                      ),

                                      
                                    ],
                                  ),
                                )
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    )
                  ],
                ),
              ),
            ),
            ),
        ),
      ),
    );
  }
}


class Promotion{
  String title;
  String description;
  String image;
  bool isValid;
  String expirationDate;
  int percentageOff;

  Promotion({
    required this.title,
    required this.description,
    required this.image,
    required this.isValid,
    required this.expirationDate,
    required this.percentageOff
  });
}