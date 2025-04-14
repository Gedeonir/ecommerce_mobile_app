import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/Header.dart';
import 'package:project_x/Components/SubmitBtn.dart';
import 'package:project_x/Components/TextField.dart';

class addAddressModal extends StatefulWidget{
  @override

  _addAddressState createState() => _addAddressState();


}

class _addAddressState extends State<addAddressModal> {
  List<String> inputs=[
    'Full names',
    'Address',
    'Country',
    'City',
    'State/Province/Region',
    'Zip Code(Postal code)'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Header(title: 'Add shipping address'),

            Expanded(
              child:SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        children: inputs.map((item){
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child:CustomTextField(
                              labelText: item,
                              obscureText: false,
                              controller: TextEditingController(),
                              textStyle: TextStyle(color: AppColors.black, fontSize: 20),
                              labelStyle: TextStyle(color: AppColors.gray, fontSize: 20),
                              cursorColor: AppColors.black,
                              containerColor: AppColors.white,
                              fillColor: AppColors.white,
                              contentPadding: EdgeInsets.all(20),
                              boxShadow: BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                blurRadius: 10.0,
                                spreadRadius: 0.2,
                                offset: Offset(0, 1),
                              ),
                            ),
                          );
                          
                        }).toList(),


                      ),
                      
                      SizedBox(height: 20,),
                      SubmitBtn(text: 'Save address', press: (){})
                    ],
                  )
                ),
              ) 
            )
          ],
        ),
      )
    );
  }
}