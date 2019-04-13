import 'package:flutter/material.dart';
import 'package:flutter_app_model/app_home_page.dart';
import 'package:flutter_app_model/constants/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉右上角debug标签
      title: 'Flutter app',
      theme: ThemeData(
        primaryColor: Color(AppColors.APP_THEME),
      ),
      home: AppHomePage(),
    );
  }
}

