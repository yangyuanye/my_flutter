import 'package:flutter/material.dart';
import 'package:flutter_app_model/app_bar.dart';

class NewsListPage extends StatefulWidget {
  NewsListPage(this.title);
  String title;
  @override
  _NewsListPageState createState() => _NewsListPageState(title);
}

class _NewsListPageState extends State<NewsListPage> {
  _NewsListPageState(this._title);
  String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_title).myAppBar,
      body: Text(_title),
    );
  }
}