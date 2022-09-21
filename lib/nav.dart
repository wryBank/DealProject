import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:deal/homePage.dart';
import 'package:deal/notificationPage.dart';
import 'package:deal/profilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class nav extends StatefulWidget {
  const nav({Key? key}) : super(key: key);

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  int _page = 0;
  final screen = [homePage(), profilePage(), notificationPage()];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder
    (future: firebase, builder: (context,snapshot){
      //error
      if(snapshot.hasError){
        return Scaffold(
          appBar: AppBar(title: Text("Error"),),
          body: Center(child: Text("${snapshot.error}")),
        );
        
      }
      //if Connected 
      if(snapshot.connectionState == ConnectionState.done){
    return Scaffold(
        backgroundColor: Color.fromRGBO(133, 244, 255, 1),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromRGBO(133, 244, 255, 1),
          color: Color.fromRGBO(66, 194, 255, 1),
          key: _bottomNavigationKey,
          animationDuration: Duration(milliseconds: 350),
          items: [
            Icon(FontAwesomeIcons.home),
            Icon(FontAwesomeIcons.home),
            Icon(FontAwesomeIcons.home),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        appBar: AppBar(
          title: Text("title"),
          backgroundColor: Color.fromRGBO(66, 194, 255, 1),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () {},
          ),
          actions: [
            IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: () {})
          ],
        ),
        body: screen[_page]);

      }
      
      //wait for firebase
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }
    );


  }
}
