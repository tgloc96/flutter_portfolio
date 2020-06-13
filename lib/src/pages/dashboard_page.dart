import 'package:flutter/material.dart';
import 'package:flutter_cv/src/blocs/app_bloc.dart';
import 'package:flutter_cv/src/common/app_constants.dart';
import 'package:flutter_cv/src/models/app_data.dart';
import 'package:flutter_cv/src/widgets/activity_indicator.dart';
import 'package:flutter_cv/src/widgets/screen_type_layout_custom.dart';

import 'about_page.dart';
import 'home_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final _appBloc = AppBloc();
  final _pageController = PageController();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _appBloc.loadData();
    _tabController = TabController(
      length: 2,
      vsync: this,
    )
      ..addListener(() {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(
            milliseconds: 250,
          ),
          curve: Curves.easeInOut,
        );
      });
    _pageController.addListener(() {
      if (_pageController.page == _pageController.page.toInt()) {
        _tabController.animateTo(
          _pageController.page.toInt(),
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    _appBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AppData>(
        stream: _appBloc.appDataStream,
        initialData: _appBloc.appDataValue,
        builder: (context, snapshot) {
          if (snapshot?.data == null) {
            return const ActivityIndicator();
          }

          final appData = snapshot.data;

          final homePage = HomePage(home: appData.home);
          final aboutPage = AboutPage(about: appData.about);

          Widget buildUIDesktop() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenTypeLayoutCustom(
                  desktop: buildTabBar(),
                  tablet: buildTabBar(),
                  mobile: const SizedBox(),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    pageSnapping: false,
                    children: [
                      HomePage(
                        home: appData.home,
                      ),
                      AboutPage(
                        about: appData.about,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          Widget buildUIMobile() {
            return SingleChildScrollView(
              child: Column(
                children: [
                  homePage,
                  aboutPage,
                ],
              ),
            );
          }

          return ScreenTypeLayoutCustom(
            desktop: buildUIDesktop(),
            tablet: buildUIMobile(),
            mobile: buildUIMobile(),
          );
        },
      ),
    );
  }

  Widget buildTabBar() {
    final tabBar = Container(
      height: AppConstants.heightTabBar,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
          isScrollable: true,
          controller: _tabController,
          labelColor: Theme
              .of(context)
              .primaryColor,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 48,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Theme
              .of(context)
              .primaryColor,
          indicatorWeight: 4,
          indicatorPadding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 0,
            bottom: 8,
          ),
          tabs: const [
            Tab(
              text: 'HOME',
            ),
            Tab(
              text: 'ABOUT ME',
            ),
          ],
        ),
      ),
    );
    return ScreenTypeLayoutCustom(
      mobile: const SizedBox(),
      tablet: const SizedBox(),
      desktop: tabBar,
    );
  }
}
