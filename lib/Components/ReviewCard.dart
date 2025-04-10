import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_1_tpakmp.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: AppTextStyles.descriptiveItem),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBarIndicator(
                            rating: 4.8,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                          ),
                          Text(
                            'April 8,2025',
                            style: AppTextStyles.descriptionText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "I recently bought this hoodie, and I have to say, it's an absolute game-changer for comfort and style. The fabric is incredibly soft, making it perfect for lounging at home or going out. It’s not too thick, so it works well for layering during cooler days, but it's also warm enough to keep you cozy when it's chilly.The fit is just right – not too tight, not too loose. I appreciate the way it contours to the body without being restrictive. The hood itself is spacious, which is great for extra coverage on windy days. The drawstrings add a nice touch, allowing you to adjust the hood for a snug fit.",
                style: AppTextStyles.descriptionText,
              ),
            ),

            Row(
              children: [
                Text('Helpful?', style: AppTextStyles.descriptiveItem),
                Spacer(),
                Text('Yes', style: AppTextStyles.descriptionText),
                SizedBox(width: 10),
                Text('No', style: AppTextStyles.descriptionText),
              ],
            )
          ],
        ),
      ),
    );
  }
}
