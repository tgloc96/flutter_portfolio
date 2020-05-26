import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_page.dart';
import 'home_page.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    )..addListener(() {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(
            milliseconds: 250,
          ),
          curve: Curves.easeInOut,
        );
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      final isMobile = sizingInfo.isMobile;
      return Scaffold(
        appBar: buildAppBar(isMobile),
        drawer: buildDrawer(isMobile),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ScreenTypeLayout(
                desktop: buildTabBar(),
                tablet: buildTabBar(),
                mobile: const SizedBox(),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                children: [
                  HomePage(),
                  AboutPage(),
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildAppBar(bool isMobile) {
    if (!isMobile) return null;
    return AppBar(
      title: Text('Home'),
    );
  }

  Widget buildDrawer(bool isMobile) {
    if (!isMobile) return null;
    return Drawer(
      elevation: 10,
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
          ),
          ListTile(
            leading: Icon(Icons.mobile_screen_share),
            title: Text('ABOUT ME'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('SHOW CASE'),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('CONTACT'),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      height: 50,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          final paddingHorizontal = constraints.maxWidth <= 700 ? 16.0 : 48.0;
          return TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            labelPadding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 4,
            indicatorPadding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 0,
              bottom: 8,
            ),
            tabs: [
              Tab(
                text: 'HOME',
              ),
              Tab(
                text: 'SHOWCASE',
              ),
              Tab(
                text: 'ABOUT ME',
              ),
              Tab(
                text: 'CONTACT',
              ),
            ],
          );
        }),
      ),
    );
  }
}
