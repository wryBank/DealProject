// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class authOTP extends StatefulWidget {
  const authOTP({Key? key}) : super(key: key);

  @override
  State<authOTP> createState() => _authOTPState();
}

class _authOTPState extends State<authOTP> {
  @override
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
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
      body: Center(child: 
      TextField(obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "PhoneNumber"
      ),
      )
      
      ),
    );

      }
      
      //wait for firebase
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }
    );
    
  }
}