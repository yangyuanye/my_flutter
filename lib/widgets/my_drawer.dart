import 'package:flutter/material.dart';

class HomeMyDrawer extends StatelessWidget{
  final String headImgPath;
  final List menuTitles;
  final List menuIcons;
  HomeMyDrawer({Key key,
    @required this.headImgPath,
    @required this.menuTitles,
    @required this.menuIcons})
      : assert(headImgPath != null),
        assert(menuTitles != null),
        assert(menuIcons != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 0.0,
      child: ListView.separated(
        padding: const EdgeInsets.all(0.0),
          separatorBuilder: (context,index){
          if(index == 0){
            return Divider(height: 0.0,);
          }else{
            return Divider(height: 1.0,);
          }
          },
          itemBuilder: (context,index){
            if(index == 0){
              return Image.asset(headImgPath,fit: BoxFit.cover,);
            }else{
              index -= 1 ;
              return ListTile(
                leading: Icon(menuIcons[index]),
                title: Text(menuTitles[index]),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  //TODO 待实现
                },
              );
            }
          },
          itemCount: menuTitles.length +1),
    );
  }


}