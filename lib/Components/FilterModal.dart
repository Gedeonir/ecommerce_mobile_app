import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/BrandModal.dart';
import 'package:project_x/Components/SubmitBtn.dart';
class FilterModal extends StatefulWidget {
  // Initial price range (min, max)
  final double minPrice;
  final double maxPrice;

  // The selected price range
  final double currentMinPrice;
  final double currentMaxPrice;

  // Slider range values
  final double minSliderValue;
  final double maxSliderValue;

  final ValueChanged<RangeValues> onPricesChanged;
  final ValueChanged<String> onColorChange;
  final ValueChanged<String> onCategoryChange;

  final String color;
  final String category;

  const FilterModal({
    Key? key,
    required this.currentMinPrice,
    required this.currentMaxPrice,
    required this.minSliderValue,
    required this.maxSliderValue,
    required this.minPrice,
    required this.maxPrice,
    required this.onPricesChanged,
    required this.color,
    required this.onColorChange,
    required this.category,
    required this.onCategoryChange,
  }) : super(key: key);
  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late double _currentMin;
  late double _currentMax;
  late String _colorName;
  late String _categoryName;

  List<String> colors = [
    'black',
    'bluegrey',
    'navyblue',
    'red',
    'green',
    'indigo'
  ];

  Map<String, Color> colorMap = {
    'black': Colors.black,
    'bluegrey': Colors
        .blueGrey, // You might need a custom color code for beige, as it's not available in the Colors class
    'navyblue':
        Colors.blue[900]!, // You can use a specific shade of blue as navyblue
    'red': Colors.red,
    'green': Colors.green,
    'indigo': Colors.indigo,
  };

  List<String> Sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  List<String> Categories = ['All', 'Men', 'Women', 'Boys', 'Girls', 'Kids'];

  @override
  void initState() {
    super.initState();
    _currentMin = widget.currentMinPrice;
    _currentMax = widget.currentMaxPrice;
    _colorName = widget.color;
    _categoryName = widget.category;
  }

  List<String> Brands=[];

  void updateBrands( List<String> brand) {
  
    setState(() {
      Brands = brand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Header(
                  title: "Filter options",
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Price range: \$${_currentMin.toStringAsFixed(1)} - \$${_currentMax.toStringAsFixed(1)}",
                            style: AppTextStyles.descriptiveItem,
                          ),
                          SizedBox(height: 10),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbColor: AppColors.primary,
                                rangeThumbShape: RoundRangeSliderThumbShape(
                                    enabledThumbRadius: 10),
                                activeTrackColor: AppColors.primary,
                                inactiveTrackColor: AppColors.gray,
                              ),
                              child: RangeSlider(
                                values: RangeValues(_currentMin, _currentMax),
                                min: widget.minSliderValue,
                                max: widget.maxSliderValue,
                                divisions: 100,
                                labels: RangeLabels(
                                  '\$${_currentMin.toStringAsFixed(0)}',
                                  '\$${_currentMax.toStringAsFixed(0)}',
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentMin = values.start;
                                    _currentMax = values.end;
                                  });
                                  widget.onPricesChanged(values);
                                },
                              )),
                          SizedBox(height: 20),
                          Text(
                            "Color",
                            style: AppTextStyles.descriptiveItem,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: colors.map((item) {
                                  String currentColorName = item;
                                  Color currentColor =
                                      colorMap[currentColorName] ??
                                          Colors.black;

                                  return SizedBox(
                                      width: 90,
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _colorName = item;
                                              });
                                              widget.onColorChange(item);
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: _colorName == item
                                                      ? AppColors.primary
                                                      : Colors.transparent,
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: currentColor,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            item,
                                            style: AppTextStyles.caption,
                                          ),
                                        ],
                                      ));
                                }).toList(),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Sizes',
                            style: AppTextStyles.descriptiveItem,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: Sizes.map((size) {
                                return Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: GestureDetector(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.gray,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          size,
                                          style: AppTextStyles.descriptiveItem,
                                        ),
                                      ),
                                    ));
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Categories',
                            style: AppTextStyles.descriptiveItem,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: Categories.map((item) {
                                return Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _categoryName = item;
                                        });

                                        widget.onCategoryChange(item);
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: _categoryName == item
                                                ? AppColors.primary
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: _categoryName == item
                                                    ? AppColors.primary
                                                    : AppColors.gray,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          item,
                                          style: _categoryName == item
                                              ? AppTextStyles.ButtonText
                                              : AppTextStyles.descriptiveItem,
                                        ),
                                      ),
                                    ));
                              }).toList(),
                            ),
                          ),

                          SizedBox(height: 20,),

                          GestureDetector(
                            onTap: (){
                              _showBrandOptionsOverlay(context);  
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Brand',style: AppTextStyles.descriptiveItem,),
                                    SizedBox(height: 10,),
                                    Text(Brands.length <=0? 'No brand selected' : Brands.join(', '), 
                                    style: AppTextStyles.descriptionText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),

                                Icon(
                                  Icons.chevron_right,
                                  size: 20,
                                  color: AppColors.black,
                                ),
                                  
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Container(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: (){}, 
                                        child: Text('Discard',style:AppTextStyles.descriptiveItem),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          minimumSize: Size(double.infinity, 50
                                          ),
                                          side: BorderSide(
                                            color: AppColors.gray, // Border color
                                            width: 2, // Border width
                                          ),),
                                        )
                                    ),

                                    SizedBox(width: 10,),

                                    Expanded(
                                      child:SubmitBtn(text: "Apply", press: ()=>{}),

                                    )

                                   
                                  ],
                                )
                              ),
                            ),
                        ]))
              ],
          )
        )
      )
    );
  }
  

  void _showBrandOptionsOverlay(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // Dim the background
      transitionDuration: Duration(milliseconds: 300), // Transition speed
      pageBuilder: (context, animation, secondaryAnimation) {
        return BrandModal(
          brands: Brands,
          updateBrands: updateBrands,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Set the offset for sliding in from the right
        const begin = Offset(1.0, 0.0); // Start from the right side
        const end = Offset.zero; // End at the center

        // Set the curve for the animation
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
