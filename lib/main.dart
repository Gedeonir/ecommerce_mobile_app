import 'package:flutter/material.dart';
import 'package:project_x/pages/Assignment.dart';
import 'package:project_x/pages/Favourites.dart';
import 'package:project_x/pages/Home.dart';
import 'package:project_x/pages/MyBag.dart';
import 'package:project_x/pages/OrderDetails.dart';
import 'package:project_x/pages/OrdersList.dart';
import 'package:project_x/pages/ProductList.dart';
import 'package:project_x/pages/Profile.dart';
import 'package:project_x/pages/ShipmentAddress.dart';
import 'package:project_x/pages/Shop.dart';
import 'package:project_x/pages/SignIn.dart';
import 'package:project_x/pages/SignUp.dart';
import 'package:project_x/pages/homepage.dart';
import 'package:project_x/pages/Listing.dart';
import 'package:project_x/pages/ViewOneProduct.dart';
import 'Components/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shopping App',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: AppColors.background
      ),
      initialRoute: '/',
      routes: {
        // '/':(context)=>Assignment(),
        
        '/signup':(context)=>SignUp(),
        '/login':(context)=>SignIn(),
        '/':(context)=>Home(),
        '/shop_now':(context)=>Shop(),
        '/shop_now/products':(context)=>Productlist(),
        '/shop_now/one/product':(context)=>ViewOneProduct(),
        '/my_favorites':(context)=>Favourites(),
        '/my_bag':(context)=>MyBag(),
        '/my_profile':(context)=>Profile(),
        '/my_profile/orders':(context)=>OrdersList(),
        '/my_profile/orders/details':(context)=>OrderDetails(),
        '/my_profile/shipping_address':(context)=>Shipmentaddress(),
      }
    );
  }
}

