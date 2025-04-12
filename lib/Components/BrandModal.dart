import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/SubmitBtn.dart';

class BrandModal extends StatefulWidget {
  final List<String> brands;
  final ValueChanged<List<String>> updateBrands;

  const BrandModal({
    Key?key,
    required this.brands,
    required this.updateBrands
  }): super(key: key);

  @override
  _BrandModalState createState() => _BrandModalState();
}

class _BrandModalState extends State<BrandModal> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> sortingCategories = [
    'Louis vuitton',
    'Puma',
    'Clarks',
    'Chanel',
    'Adidas',
    'Nike'
  ];


  void _performSearch() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  late List<String> _brand;

  void initState() {
    super.initState();
    _brand=widget.brands;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
      child: Column(
        children: [
          Header(title: 'Choose brand'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: AppTextStyles.descriptiveItem,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: AppColors.gray,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.gray,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // No border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sortingCategories.length,
              itemBuilder: (context, index) {
                final title = sortingCategories[index];

                return ListTile(
                  title: Text(
                    title,
                    style: _brand.contains(title)
                        ? AppTextStyles.activeSort
                        : AppTextStyles.subHeads,
                  ),
                  trailing: _brand.contains(title)
                      ? Icon(Icons.check, color: AppColors.primary)
                      : null,
                  selected: _brand.contains(title),
                  onTap: () {
                    if (_brand.contains(title)) {
                      _brand.remove(title);
                    } else {
                      _brand.add(title);
                    }
                    widget.updateBrands(_brand);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
