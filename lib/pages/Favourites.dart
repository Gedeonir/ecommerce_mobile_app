import 'package:flutter/material.dart';
import 'package:project_x/Components/BottomNavigation.dart';

class Favourites extends StatefulWidget{
  @override
  _FavouritesState createState()=>_FavouritesState();
}


class _FavouritesState extends State<Favourites>{
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigation(),

    );
  }
}