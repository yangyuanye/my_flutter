import 'package:flutter/material.dart';
import 'package:flutter_app_model/app_bar.dart';
import 'package:flutter_app_model/constants/app_colors.dart';
import 'package:flutter_app_model/constants/app_strings.dart';
import 'package:flutter_app_model/widgets/my_drawer.dart';

class MyPage extends StatefulWidget {
  MyPage(this.title);

  String title;

  @override
  _myPageState createState() {
    return _myPageState(title);
  }
}

class _myPageState extends State<MyPage> {
  _myPageState(this._title);

  String _title = "";

  String userAvatar; //用户头像
  String userName; //用户名称

  List menuTitles;

  List menuIcons;

  @override
  void initState() {
    super.initState();
    menuTitles = [
      '我的消息',
      '阅读记录',
      '我的博客',
      '我的问答',
      '我的活动',
      '我的团队',
      '邀请好友',
    ];
    menuIcons = [
      Icons.message,
      Icons.print,
      Icons.error,
      Icons.phone,
      Icons.send,
      Icons.people,
      Icons.person,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_title).myAppBar,
      drawer: HomeMyDrawer(
        headImgPath: 'assets/images/cover_img.jpg',
        menuIcons: [Icons.send, Icons.home, Icons.error, Icons.settings],
        menuTitles: [
          AppStrings.MY_DRAWER_RELEASE_DYNAMIC,
          AppStrings.MY_DRAWER_RELEASE_DYNAMIC,
          AppStrings.MY_DRAWER_ABOUT,
          AppStrings.MY_DRAWER_SET
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildHeader();
            }
            index -= 1;
            return ListTile(
              leading: Icon(menuIcons[index]),
              title: Text(menuTitles[index]),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                //TODO 待实现
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 0.0);
          },
          itemCount: menuTitles.length + 1),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 150.0,
      color: Color(AppColors.APP_THEME),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(AppColors.white),
                    width: 1.0,
                  ),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/ic_avatar_default.png',
                  image: userAvatar ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                //TODO 待实现
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              userName ?? '点击头像登录',
              style: TextStyle(color: Color(AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
