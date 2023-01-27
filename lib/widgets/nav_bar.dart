import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> tabs = const [
    Library(),
    Store(),
    Search(),
    Profile(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        activeColor: Palette.black,
        inactiveColor: Palette.black40,
        onTap: (index) => setState(() => _currentIndex = index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 0 ? Images.library : Images.libraryO,
              color: _currentIndex == 0 ? Palette.black : Palette.black40,
            ),
            label: 'Library',
            tooltip: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 1 ? Images.store : Images.storeO,
              color: _currentIndex == 1 ? Palette.black : Palette.black40,
            ),
            label: 'Store',
            tooltip: 'Store',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 2 ? Images.search : Images.searchO,
              color: _currentIndex == 2 ? Palette.black : Palette.black40,
            ),
            label: 'Search',
            tooltip: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 3 ? Images.profile : Images.profileO,
              color: _currentIndex == 3 ? Palette.black : Palette.black40,
            ),
            label: 'Profile',
            tooltip: 'Profile',
          )
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        returnValue = CupertinoTabView(
          builder: (context) => CupertinoPageScaffold(child: tabs[index]),
        );
        return returnValue;
      },
    );
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: tabs,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Palette.black,
        unselectedItemColor: Palette.black40,
        unselectedLabelStyle: const TextStyle(fontSize: 14.0),
        selectedLabelStyle: const TextStyle(fontSize: 14.0),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                _currentIndex == 0 ? Images.library : Images.libraryO,
                color: _currentIndex == 0 ? Palette.black : Palette.black40,
              ),
            ),
            label: 'Library',
            tooltip: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                _currentIndex == 1 ? Images.store : Images.storeO,
                color: _currentIndex == 1 ? Palette.black : Palette.black40,
              ),
            ),
            label: 'Store',
            tooltip: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                _currentIndex == 2 ? Images.search : Images.searchO,
                color: _currentIndex == 2 ? Palette.black : Palette.black40,
              ),
            ),
            label: 'Search',
            tooltip: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                _currentIndex == 3 ? Images.profile : Images.profileO,
                color: _currentIndex == 3 ? Palette.black : Palette.black40,
              ),
            ),
            label: 'Profile',
            tooltip: 'Profile',
          )
        ],
      ),
    );
  }
}
