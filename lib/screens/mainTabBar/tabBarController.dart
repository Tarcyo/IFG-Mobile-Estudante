import 'package:ifg_mobile_estudante/styles/colors.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class TabBarController extends StatefulWidget {
  final List<TabBarItem> items;

  const TabBarController({Key? key, required this.items}) : super(key: key);

  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  late List<GlobalKey<NavigatorState>> _navigatorKeys;
  late PageController _pageController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _navigatorKeys =
        List.generate(widget.items.length, (_) => GlobalKey<NavigatorState>());
    _pageController = PageController(initialPage: _selectedTab);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPopNow, result) =>  {
        if (_navigatorKeys[_selectedTab].currentState?.canPop() ?? canPopNow)
          {_navigatorKeys[_selectedTab].currentState?.pop()}
        else if (_selectedTab == 0)
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Atenção",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Deseja realmente sair?",
                        style: TextStyle(
                          color: messageTextColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.0),
                            ),
                          ),
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            "Sim",
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Não",
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          }
        else
          {
            setState(() {
              _selectedTab = 0;
              _pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            })
          }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
          children: List.generate(
            widget.items.length,
            (index) => Navigator(
              key: _navigatorKeys[index],
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) => widget.items[index].widget,
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          selectedItemColor: backgroundColor,
          unselectedItemColor: backgroundColor,
          backgroundColor: mainColor,
          onTap: (index) {
            if (index == _selectedTab) {
              _navigatorKeys[index]
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _selectedTab = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                );
              });
            }
          },
          items: widget.items
              .map((item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.title,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class TabBarItem {
  final Widget widget;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  TabBarItem({
    required this.widget,
    this.navigatorkey,
    required this.title,
    required this.icon,
  });
}
