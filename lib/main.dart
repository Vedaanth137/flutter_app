import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_screens/buyerpage.dart';
import 'app_screens/cart.dart';
import 'app_screens/home.dart';
import 'app_screens/sellpagehome.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring widgets",
    home: Home(),
  routes: {
    '/buypage': (context) => BuyerPage(),
    '/cart': (context) => CartPage(),
    '/sellpage': (context) => SellPageHome(),
  }
  )
  );

}
