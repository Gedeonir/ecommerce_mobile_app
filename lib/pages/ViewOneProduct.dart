import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/Ratings.dart';
import 'package:project_x/Components/SubmitBtn.dart';

class ViewOneProduct extends StatefulWidget {
  _ViewOneProductState createState() => _ViewOneProductState();
}

class _ViewOneProductState extends State<ViewOneProduct> {
  String selectedOption = 'Size';

  List<String> options = ['Size', 'Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 50,
                color: AppColors.white,
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Header(title: "Product name"),
                    Icon(
                      Icons.share,
                      color: AppColors.black,
                    )
                  ],
                )),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.network(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.network(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.network(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_tnu1hi.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )),

                  //End of banner

                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.gray,
                                  width: 0.5,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedOption,
                                  icon: Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: AppTextStyles.subHeads,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedOption = newValue!;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: AppTextStyles.subHeads,
                                      ),
                                    );
                                  }).toList(),
                                  dropdownColor: AppColors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.gray,
                                  width: 0.5,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedOption,
                                  icon: Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: AppTextStyles.subHeads,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedOption = newValue!;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: AppTextStyles.subHeads,
                                      ),
                                    );
                                  }).toList(),
                                  dropdownColor: AppColors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,

                                shape: BoxShape
                                    .circle, // Ensure the shadow is circular
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    offset:
                                        Offset(0, 4), // Shadow position (x, y)
                                    blurRadius: 6, // Shadow blur radius
                                    spreadRadius: 2, // Spread radius
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.white,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                    color: AppColors.gray,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("H&H",style: AppTextStyles.heading1,),
                                Text("Long slevess yellow hoodie",style: AppTextStyles.descriptionText,),
                                SizedBox(height: 4,),
                                RatingBarIndicator(
                                  rating: 3.2,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 16,
                                ),

                              ],
                            ),

                            Text("\$ 199.99",style: AppTextStyles.heading1,),
                          ],
                        )
                        ,),

                        SizedBox(height: 10,),
                        Text("Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed",style: AppTextStyles.subHeads,),
                        SizedBox(height: 20,),

                        SubmitBtn(text: 'Add to bag', press: (){}),

                        SizedBox(height: 20,),
                        Ratings(),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
