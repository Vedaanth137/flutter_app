import 'package:flutter/material.dart';
import 'package:flutter_app/components/cart-item.dart';


class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView(children: <Widget>[
                    CartItem(),
                    CartItem(),
                    CartItem(),
                    ListTile( leading: Icon(Icons.local_offer),title: Text("Apply Coupon"), trailing: Icon(Icons.arrow_right), onTap: () {},)
                  ])),
              Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide(
                      width: 1.0,
                      color: Colors.grey[350]
                  ))),
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Delivered by 1 PM"),
                        subtitle: Text("bring your own container"),
                        leading: Icon(Icons.location_on),
                        trailing: FlatButton(
                          textColor: Colors.orange[900],
                          child: Text("CHANGE"),
                          onPressed: () {},
                        ),
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Expanded(child: Center(child: Text("\Rs. 200 ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),))),
                          Expanded(
                              child: RaisedButton(
                                child: Text("MAKE PAYMENT"),
                                onPressed: () {},
                                elevation: 0,
                                color: Colors.green[600],
                                textColor: Colors.white,
                              ))
                        ],
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
