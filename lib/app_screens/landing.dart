import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/registration.dart';
import 'package:flutter_app/app_screens/sellpageoffice.dart';
import 'package:flutter_app/app_screens/sidebar.dart';
import 'package:http/http.dart' as http;

import 'officehometab.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme : IconThemeData(
              color: Colors.white
      )
      ),
      drawer: new SideBar(),
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage('images/onion.jpeg'), fit: BoxFit.cover, )
        ),
        child :
          Column(
            children: <Widget>[
              Container(
                child: new BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: new Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'OOEEL',
                        style: TextStyle(fontSize: 70, color: Colors.black,fontFamily: 'Raleway', ),
                      ),
                    ),
                    decoration: new BoxDecoration(color: Colors.white.withOpacity(0.4),borderRadius: BorderRadius.circular(10.0))
                    ,
                  ),
                ),
                height: 400,
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 80.0, bottom: 20.0),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/buypage');
                            },
                            child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 3,
                                ),
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Center(
                                        child : Text(
                                          "Order Food",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Raleway',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Order delicious food from homemade chefs",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Raleway',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0, bottom: 80.0),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: GestureDetector(
                            onTap: () {Navigator.pushNamed(context, '/cart');},
                            child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 3,
                                ),
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Center(
                                        child : Text(
                                          "Sell Food",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Raleway',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Register yourself as homecook",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Raleway',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              )
            ]
        ),
      )
    );
  }
}