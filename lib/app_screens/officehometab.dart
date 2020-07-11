import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/sellpageoffice.dart';
import 'package:flutter_app/app_screens/sellpagehome.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// profile page

class OfficeHomeTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OfficeHomeTabState();
  }
}

class _OfficeHomeTabState extends State<OfficeHomeTab> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: false,
      appBar: new AppBar(
          centerTitle : true,
          title: new Text("Sell An Item",style: TextStyle(fontSize: 30, color: Colors.black,fontFamily: 'Raleway', ),),
          elevation: 0,
          backgroundColor: Colors.greenAccent,
          iconTheme : IconThemeData(
              color: Colors.black),
        bottom: new TabBar(
          labelColor: Colors.redAccent,
          indicatorColor: Colors.teal,
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home),text: "Home",),
            new Tab(icon: new Icon(Icons.laptop),text: "Office",)
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
          children: <Widget>[
            new SellPageHome(),
            new SellPageOffice(),
          ], ),

    );
  }
}