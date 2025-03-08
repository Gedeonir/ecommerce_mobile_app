import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';
import 'package:project_x/Components/AppStyles.dart';
import 'package:project_x/Components/SubmitBtn.dart';
import 'package:project_x/Components/TextField.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
      child:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              
              Text("Sign Into Your Account", 
              style: AppTextStyles.heading1
              ),

              SizedBox(height: 20,),

               CustomTextField(
                labelText: 'Email',
                obscureText: false,
                controller: TextEditingController(),
                textStyle: TextStyle(color: AppColors.black, fontSize: 14),
                labelStyle: TextStyle(color: AppColors.gray, fontSize: 14),
                cursorColor: AppColors.black,
                containerColor: AppColors.success,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.all(10),
                boxShadow: BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 0.2,
                  offset: Offset(0, 1),
                ),
              ),

              SizedBox(height: 20,),

              CustomTextField(
                labelText: 'Password',
                obscureText: true,
                controller: TextEditingController(),
                textStyle: TextStyle(color: AppColors.black, fontSize: 14),
                labelStyle: TextStyle(color: AppColors.gray, fontSize: 14),
                cursorColor: AppColors.black,
                containerColor: AppColors.success,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.all(10),
                boxShadow: BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 0.2,
                  offset: Offset(0, 1),
                ),
              ),

         

              

              SizedBox(height: 20,),

              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, '/forgotPassword'),
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?", style: AppTextStyles.descriptiveItem,),
                  Icon(Icons.arrow_right_alt_sharp, color: AppColors.primary,)
                ],
                ),
                ),
              

              SizedBox(height: 20,),

              SubmitBtn(text: "Sign In", press: ()=>Navigator.pushNamed(context, '/home')),
              
              SizedBox(height: 20,),

              Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          spreadRadius: 0.2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.g_mobiledata, color: AppColors.primary),
                        ),
                        Text(
                          "Continue with Google",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    ),
                  )
             
            ],
          )
        )
      ) ,
    )
    );
  }
}