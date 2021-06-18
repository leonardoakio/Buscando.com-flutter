import 'package:flutter/material.dart';
import 'package:projeto_blog/screens/blogPage.dart';
import 'package:projeto_blog/screens/homePage.dart';
import 'package:projeto_blog/screens/home_screen.dart';
import 'package:projeto_blog/screens/loginPage.dart';
import 'package:projeto_blog/screens/shopPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red.shade900,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.red.shade900),
        title: Text('Home', style: TextStyle(color: Colors.black54))),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.chat,
          color: Colors.red.shade900,
          size: 35,
        ),
        title: Text('Chat', style: TextStyle(color: Colors.black54))),
    BottomNavigationBarItem(
        icon: Icon(Icons.featured_play_list, color: Colors.red.shade900),
        title: Text('Feed', style: TextStyle(color: Colors.black54))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  scrollDirection: Axis.vertical,      caso o slide for vertical
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          HomePage(),
          HomeScreen(),
          BlogPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
