
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:deal/notificationPage.dart';
import 'package:deal/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;
  final screen = [
    home(),
    profilePage(),
    notificationPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(133, 244, 255, 1),
    bottomNavigationBar:CurvedNavigationBar(
    backgroundColor: Color.fromRGBO(133, 244, 255, 1),
    color:Color.fromRGBO(66, 194, 255, 1),
    key: _bottomNavigationKey,
    animationDuration: Duration(milliseconds: 350),
      items: [
      Icon(FontAwesomeIcons.home),
      Icon(FontAwesomeIcons.home),
      Icon(FontAwesomeIcons.home),
    ],
    onTap: (index){
      setState(() {
        _page = index;
        print(_page);
        print(screen[_page].toString());
      });
    },
    ),
    appBar: AppBar(title: Text('home')),
    body:screen[_page]
    );
    
  }
}