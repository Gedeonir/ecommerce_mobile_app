import 'package:flutter/material.dart';
import 'package:project_x/pages/Assignment.dart';
import 'package:project_x/pages/Home.dart';
import 'package:project_x/pages/ProductList.dart';
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
        textTheme: GoogleFonts.poppinsTextTheme(
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
      }
    );
  }
}

