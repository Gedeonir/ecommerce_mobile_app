import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';

class CategoriesCard extends StatelessWidget {
  final String image;
  final String caption;

  const CategoriesCard({Key? key, required this.image, required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              image,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image, size: 50, color: Colors.red);
              },
              fit: BoxFit.cover, // Makes the image cover the screen
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7), // Dark at the bottom
                    Colors.transparent, // Fully transparent at the top
                  ],
                ),
              ),
            ),
          ),

          Positioned(
              child: Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$caption",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))))
        ],
      ),
    );
  }
}
