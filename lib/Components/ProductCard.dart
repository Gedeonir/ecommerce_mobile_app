import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class ProductCard extends StatelessWidget{
   final String imageUrl;
  final String title;
  final String description;
  final double price;
  final double rating;
  final VoidCallback onFavoritePressed;
  final bool newLabel;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.onFavoritePressed,
    required this.newLabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),

      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15)

                ),

                child: Image.network(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                child: Text(
                  title,
                  style: AppTextStyles.descriptiveItem,
                  maxLines:1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(height: 8,),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                child: Text(
                  description,
                  style: AppTextStyles.descriptionText,
                  maxLines:1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                child: RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context,index)=>Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: AppTextStyles.subHeads,
                  ),
                  )
            ],
          ),
          
          Positioned(
            left: 10,
            top: 10,
            child:newLabel? 
            Container(
              padding: EdgeInsets.all(4),
              color: AppColors.black,
              child: Text("New",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 11)),
            )
            :
            Container(
              padding: EdgeInsets.all(4),
              color: AppColors.error,
              child: Text("-20%",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 11)),
            )
            ),

          

          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.white,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 15,
                  color: AppColors.gray,
                ),
                onPressed: onFavoritePressed,
              ),
            )
          )
          ],
      ),
    );
  }


}