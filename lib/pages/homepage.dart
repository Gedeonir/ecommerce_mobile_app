import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Shopping App"),
      ),
      body: GridView(
          padding: const EdgeInsets.all(2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10),
          children: [
            _buildCategory(context, 
            'Spring and Autumn New Boys Korean Casual Girls Breathable Sneakers Cute Shoes Fir Girls (Blue, 9 Toddler)',
            "https://i5.walmartimages.com/seo/LEEy-world-Toddler-Shoes-Children-Mesh-Spring-Autumn-New-Boys-Korean-Casual-Girls-Breathable-Sneakers-Cute-Fir-Blue-9-Toddler_31b4bad2-f738-45e3-87e5-884066b97e9a.3da4fe17d1b33554816beee33dd674f9.jpeg"),

             _buildCategory(context, 
            'Spring and Autumn New Boys Korean Casual Girls Breathable Sneakers Cute Shoes Fir Girls (Blue, 9 Toddler)',
            "https://i5.walmartimages.com/seo/LEEy-world-Toddler-Shoes-Children-Mesh-Spring-Autumn-New-Boys-Korean-Casual-Girls-Breathable-Sneakers-Cute-Fir-Blue-9-Toddler_31b4bad2-f738-45e3-87e5-884066b97e9a.3da4fe17d1b33554816beee33dd674f9.jpeg"),

             _buildCategory(context, 
            'Spring and Autumn New Boys Korean Casual Girls Breathable Sneakers Cute Shoes Fir Girls (Blue, 9 Toddler)',
            "https://i5.walmartimages.com/seo/LEEy-world-Toddler-Shoes-Children-Mesh-Spring-Autumn-New-Boys-Korean-Casual-Girls-Breathable-Sneakers-Cute-Fir-Blue-9-Toddler_31b4bad2-f738-45e3-87e5-884066b97e9a.3da4fe17d1b33554816beee33dd674f9.jpeg"),

             _buildCategory(context, 
            'Spring and Autumn New Boys Korean Casual Girls Breathable Sneakers Cute Shoes Fir Girls (Blue, 9 Toddler)',
            "https://i5.walmartimages.com/seo/LEEy-world-Toddler-Shoes-Children-Mesh-Spring-Autumn-New-Boys-Korean-Casual-Girls-Breathable-Sneakers-Cute-Fir-Blue-9-Toddler_31b4bad2-f738-45e3-87e5-884066b97e9a.3da4fe17d1b33554816beee33dd674f9.jpeg")
            ]),
    );
  }

  Widget _buildCategory(
      BuildContext context, String description, String image) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/cart'),
      child: Card(
          child: Container(
          child: Column(
        children: [
          Expanded(
              child: Image.network(
                  image,
                  fit: BoxFit.cover)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                const Text(
                  "Spring and Autumn New Boys Korean Casual Girls Breathable Sneakers Cute Shoes Fir Girls (Blue, 9 Toddler)",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Bookman old style',
                      color: Color(0xFF000D00)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Pressed');
                        },
                        child: Text('Buy'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('Pressed');
                        },
                        child: Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .zero, // Remove round corners (rectangle)
                          ),
                        ),
                      )
                    ])
              ]))
        ],
      )),
    )
    );
  }
}
