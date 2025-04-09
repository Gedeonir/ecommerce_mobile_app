import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final double rating;
  final VoidCallback onFavoritePressed;
  final bool newLabel;
  final bool noLabel;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.onFavoritePressed,
    this.newLabel = false,
    this.noLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, '/shop_now/one/product');
    },
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0), // leave space for price
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: AspectRatio(
                    aspectRatio: 1.5, // controls image height responsiveness
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    title,
                    style: AppTextStyles.descriptiveItem,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    description,
                    style: AppTextStyles.descriptionText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: AppTextStyles.subHeads,
                  ),
                ),

                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16,
                  ),
                ),
                const SizedBox(height: 4),

              ],
            ),
          ),

          // Top Left Label
          if (!noLabel)
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: newLabel ? AppColors.black : AppColors.error,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  newLabel ? "New" : "-20%",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),

          // Top Right Favorite Button
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.white,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  size: 15,
                  color: AppColors.gray,
                ),
                onPressed: onFavoritePressed,
              ),
            ),
          ),

          
        ],
      ),
    )
    );
  }
}
