import 'package:flutter/material.dart';
import 'package:flutter_app_model/constants/app_strings.dart';
import 'package:flutter_app_model/pages/main/find_page.dart';
import 'package:flutter_app_model/pages/main/my_page.dart';
import 'package:flutter_app_model/pages/main/news_list_page.dart';
import 'package:flutter_app_model/pages/main/tweet_page.dart';
import 'package:flutter_app_model/widgets/navigation_icon_view.dart';

class AppHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<AppHomePage> {
  final _appBarTitle = [AppStrings.HOME_TITLE_HEADLINES, AppStrings.HOME_TITLE2_DYNAMIC,
                        AppStrings.HOME_TITLE3_FIND, AppStrings.HOME_TITLE4_MY];
  List<NavigationIconView> _navigationIconViews;
  var _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

@override
  void initState() {
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: _appBarTitle[0],
          iconPath: 'assets/images/ic_nav_news_normal.png',
          activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(
          title: _appBarTitle[1],
          iconPath: 'assets/images/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: _appBarTitle[2],
          iconPath: 'assets/images/ic_nav_discover_normal.png',
          activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: _appBarTitle[3],
          iconPath: 'assets/images/ic_nav_my_normal.png',
          activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];
    _pages = [
      NewsListPage(_appBarTitle[0]),
      TweetPage(_appBarTitle[1]),
      FindPage(_appBarTitle[2]),
      MyPage(_appBarTitle[3]),
    ];

    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    );
  }
}
