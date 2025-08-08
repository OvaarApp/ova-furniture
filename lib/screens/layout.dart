import 'package:flutter/material.dart';
import 'package:ova_furniture_ui/screens/home_screen.dart';
import '../widgets/custom_nav_bar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), Home(), Home(), Home()];

  void onTap(int i) {
    setState(() {
      currentIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomNavBar(
                currentIndex: currentIndex,
                onTap: (newIndex) {
                  onTap(newIndex);
                },
                tabs: [
                  NavBarItem(svgPath: 'home.svg', label: 'Home'),
                  NavBarItem(svgPath: 'search.svg', label: 'Search'),
                  NavBarItem(svgPath: 'heart.svg', label: 'Favorite'),
                  NavBarItem(svgPath: 'user.svg', label: 'Person'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Center(child: Text('Coming soon'))
        ],
      ),
    );
  }
}
