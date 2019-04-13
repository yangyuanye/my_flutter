import 'package:flutter/material.dart';
import 'package:flutter_app_model/constants/app_colors.dart';
import 'package:flutter_app_model/pages/main/news_list_page.dart';
import 'package:flutter_app_model/widgets/navigation_icon_view.dart';

class AppHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<AppHomePage> {
  final _appBarTitle = ['头条', '动态', '发现', '我的'];
  List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

@override
  void initState() {
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: '头条',
          iconPath: 'assets/images/ic_nav_news_normal.png',
          activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: '动态',
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: '发现',
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: '我的',
          iconPath: 'assets/images/ic_nav_my_normal.png',
          activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];
    _pages = [
      NewsListPage(),
      NewsListPage(),
      NewsListPage(),
      NewsListPage(),
    ];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          _appBarTitle[_currentIndex],
          style: TextStyle(color: Color(AppColors.APPBAR)),
        ),
        iconTheme: IconThemeData(color: Color(AppColors.APPBAR)),
      ),
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          //禁止滑动
          itemBuilder: (BuildContext context,int index){
            return _pages[index];
          },
      controller: _pageController,
      itemCount: _pages.length,
      onPageChanged: (index){
        setState(() {
          _currentIndex = index;
            });
      },),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          items: _navigationIconViews.map((view)=>view.item).toList(),
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 1),
              curve: Curves.ease);
        },
      ),
      /*drawer: MyDrawer(
        headImgPath: 'assets/images/cover_img.jpg',
        menuIcons: [Icons.send, Icons.home, Icons.error, Icons.settings],
        menuTitles: ,
      ),*/
    );
  }
}
