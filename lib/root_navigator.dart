import 'package:flutter/material.dart';
import 'package:flutter_covid_app/screens/weather.dart';
import 'package:flutter_covid_app/widgets/chat_room.dart';
import 'package:flutter_covid_app/widgets/covid_dashboard.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class RootNavigator extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RootNavigator> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  List<Widget> _screens = [CovidDashboard(), ChatRoom(), Weather()];
  PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _screens,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          onItemSelected: (index) => _onItemTapped(
            index,
          ),
          selectedIndex: _selectedIndex,
          showElevation: false,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(
                Icons.explore_outlined,
                color: _selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              activeColor: Theme.of(context).primaryColor,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(
                Icons.list_alt_outlined,
                color: _selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
              ),
              title: Text(
                "Chat",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              activeColor: Theme.of(context).primaryColor,
            ),
            BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(
                Icons.mail_outline_outlined,
                color: _selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
              ),
              title: Text(
                "Weather",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              activeColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
