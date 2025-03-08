// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
      child:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKo0wgYXEmeacf-EFGI6GVzRUW943r3B9IWA&s'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 20,
                        right: 20,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey[900],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 8,
                                        offset: Offset(4, 4),
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.food_bank,
                                  size: 20,
                                  color: Colors.white,
                                )),
                            Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 8,
                                        offset: Offset(4, 4),
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.blueGrey[900],
                                ))
                          ],
                        ))
                  ],
                )),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30
              ),
              alignment: Alignment.center,
              child:TextField(
              decoration: InputDecoration(
                labelText: 'search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder()

              ),
            ) 
            ),

            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Products')
                    ],
                  ),
                  
                ],
              ),

            )

          ],
        ),
      ),
    ));
  }
}



