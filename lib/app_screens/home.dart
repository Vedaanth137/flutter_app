import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/buy_sell.dart';
import 'package:flutter_app/app_screens/registration.dart';

import 'landing.dart';
import 'loginpage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage('images/onion.jpeg'), fit: BoxFit.cover, )
            ),
            padding: EdgeInsets.only(top: 165),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                //Expanded(
                //  child: getImages(),
                //),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          //widget one
                          Container(
                            child: new BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      getStartedButton()
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}


class getImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/icon.png');
    Image image = Image(
      image: assetImage,
      height: 150,
      width: 150,
      alignment: Alignment.center,
    );
    return Container(
      child: image,
    );
  }
}

class getStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        type: MaterialType.transparency,
        child:
        Container(
        padding: EdgeInsets.only(top: 300),
        width: 250,
        child: GestureDetector(
          onTap: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),);},
          child: Container(
            padding: EdgeInsets.all(10),
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
                        "Get Started",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
