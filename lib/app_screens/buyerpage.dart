import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/registration.dart';
import 'package:flutter_app/app_screens/sellpageoffice.dart';
import 'package:flutter_app/app_screens/sidebar.dart';
import 'package:flutter_app/components/cardforseller.dart';
import 'package:http/http.dart' as http;

import 'officehometab.dart';


class BuyerPage extends StatefulWidget {
  @override
  _BuyerPageState createState() => new _BuyerPageState();
}

class _BuyerPageState extends State<BuyerPage> {

  List _SellerList = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('Buy Page'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){Navigator.pushNamed(context, '/cart');}),
          ],
          titleSpacing: 20,
          elevation: 0,
      ),
      drawer: new SideBar(),
      body: new SingleChildScrollView(
        child: new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text("Sellers Near You",style: TextStyle(fontSize: 23, color: Colors.black,fontFamily: 'Raleway', )),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child:
                ListView(
                padding: EdgeInsets.all(8.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),
                  CardForSeller(),

                ],
              ),
            )
            ],
          ),
        ),
      ),
      );
  }
}