import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';

class SortOptionsOverlay extends StatelessWidget{

  final String currentOption;
  final ValueChanged<String> onOptionSelected;

const SortOptionsOverlay({
    Key? key,
    required this.currentOption,
    required this.onOptionSelected,
  }) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    List<String> sortingCategories=[
      'Price:Low to High',
      'Price:High to Low',
      'Rating: High to Low',
      'Rating: Low to High',
      'Popular',
      'Newest First'
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

                    Text('Sort by:',style: AppTextStyles.subHeads,),

                    Expanded(
                      child: ListView.builder(
                      itemCount: sortingCategories.length,
                      itemBuilder: (context, index) {
                        final title = sortingCategories[index]; // 🔹 You can access it here

                        return ListTile(
                          title: Text(
                            title,
                            style:currentOption == title ? AppTextStyles.activeSort:AppTextStyles.caption,
                            
                          ),
                          trailing: currentOption == title
                          ? Icon(Icons.check, color: AppColors.primary)
                          : null,
                          selected: currentOption == title,
                          onTap: () {
                            onOptionSelected(title);
                            Navigator.pop(context);
                          },
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