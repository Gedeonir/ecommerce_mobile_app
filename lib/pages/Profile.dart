import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/BottomNavigation.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/ScreensHeader.dart';

class Profile extends StatefulWidget{
  @override
  _Profile createState()=> _Profile();
}

class _Profile extends State<Profile>{

  List<MenuItem> menu = [
    MenuItem(title: 'Personal Information', link: '/my_profile/personal_info',desc: 'Full names, Email, Username,Password'),
    MenuItem(title: 'My Orders', link: '/my_profile/orders', desc: 'You have placed 2 orders'),
    MenuItem(title: 'Shipping Address', link: '/my_profile/shipping_address', desc: '1 address'),
    MenuItem(title: 'Payements Methods', link: '/my_profile/payements_methods', desc: 'Mobile money, Visa, Mastercard'),
    MenuItem(title: 'Settings', link: '/my_profile/settings', desc: 'Language, Theme, Notifications,Privacy, Security'),

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Screensheader(title: 'My Profile',),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://res.cloudinary.com/gedeoncloud/image/upload/v1741614593/ecomerce/image_2_1_tpakmp.png'),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Irafasha Gedeon', style: AppTextStyles.heading2),
                                Text('irafasha.jedy12@gmail.com', style: AppTextStyles.subHeads2),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),

                      
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:menu.length,
                        itemBuilder:(context, index){
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child:GestureDetector(
                              child: ListTile(
                                title: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(menu[index].title,style: AppTextStyles.subHeads,),
                                      Text(menu[index].desc,style: AppTextStyles.descriptionText,maxLines: 1,overflow: TextOverflow.ellipsis,)
                                    ],
                                  ),
                                ),
                                trailing: Icon(Icons.chevron_right),
                                onTap: (){
                                  Navigator.pushNamed(context, menu[index].link);
                                },
                              ),
                            )
                          );

                        } ,
                      )


            
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

}

class MenuItem{
  String title;
  String link;
  String desc;
  MenuItem({required this.title, required this.link, required this.desc});
}