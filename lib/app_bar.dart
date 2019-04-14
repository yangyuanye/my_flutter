import 'package:flutter/material.dart';
import 'package:flutter_app_model/constants/app_colors.dart';

class MyAppBar {
  AppBar myAppBar;
  String title;
  MyAppBar(this.title, ):
        myAppBar = AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(title ,
            style: TextStyle(color: Color(AppColors.APPBAR)),
          ),
          iconTheme: IconThemeData(color: Color(AppColors.APPBAR)),
        );
      
}