import 'package:flutter/material.dart';
import 'package:flutter_app_model/app_bar.dart';

class TweetPage extends StatefulWidget{
  TweetPage(this.title);
  String title ;
  @override
  _TweetPageState createState() {
    // TODO: implement createState
    return _TweetPageState(title);
  }

}
class _TweetPageState extends State<TweetPage>{
  _TweetPageState(this._title);
  String _title ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(_title).myAppBar,
    );
  }

}