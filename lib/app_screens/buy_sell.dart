import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/sellpageoffice.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class BuySellPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BuySellPageState();
  }
}

class _BuySellPageState extends State<BuySellPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy | Sell'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:200, left: 150),
        width: 250,
        child: Column(children: <Widget>[
          RaisedButton(color: Colors.amber,
            child: Text(
              "Buy",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {

            },
            elevation: 6,
          )
          ,
          RaisedButton(color: Colors.amber,
            child: Text(
              "Sell",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SellPageOffice(),
              ));
            },
            elevation: 6,
          )
        ],
        ),
      ),
    );
  }
}

