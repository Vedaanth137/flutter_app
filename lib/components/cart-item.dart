import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.3;
    // TODO: implement build

    return Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.center_focus_strong, size: 12,),
                        Text(""),
                        Container(
                            width: c_width,
                            child:
                            Text(
                              "Paneer Butter Masala",
                              overflow: TextOverflow.clip,
                              softWrap: true,
                            )),
                      ],
                    ),
                  )),
              Flexible(
                  flex: 2,
                  child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            iconSize: 16.0,
                            onPressed: () {},
                            color: Colors.green,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            iconSize: 16.0,
                            color: Colors.green,
                            onPressed: () {},
                          )
                        ],
                      ))),
              Flexible(
                  flex: 1,
                  child: Text(
                    "Rs 200",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
            ]));
  }
}
