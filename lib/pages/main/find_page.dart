import 'package:flutter/material.dart';
import 'package:flutter_app_model/app_bar.dart';

class FindPage extends StatefulWidget{
  FindPage(this.title);
  String title ;

  @override
  _FindPage createState() {
    // TODO: implement createState
    return _FindPage(title);
  }

}
class _FindPage extends State<FindPage>{
  _FindPage(this._title);
  String _title ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
            appBar: MyAppBar(_title).myAppBar,
    );
  }

}