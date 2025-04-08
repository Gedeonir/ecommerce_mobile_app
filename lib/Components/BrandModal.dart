import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/SubmitBtn.dart';

class BrandModal extends StatefulWidget {
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

  String currentOption = 'Adidas';

  void _performSearch() {
    setState(() {
      _searchQuery = _searchController.text;
    });
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
                    style: currentOption == title
                        ? AppTextStyles.activeSort
                        : AppTextStyles.subHeads,
                  ),
                  trailing: currentOption == title
                      ? Icon(Icons.check, color: AppColors.primary)
                      : null,
                  selected: currentOption == title,
                  onTap: () {
                    // onOptionSelected(title);
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
