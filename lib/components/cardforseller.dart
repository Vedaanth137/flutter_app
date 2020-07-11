import 'package:flutter/material.dart';

class CardForSeller extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.3;
    // TODO: implement build

    return ExpansionTile(
      leading: Icon(Icons.account_circle),
      title: Text("Chef Vedaanth Pradhan"),
      initiallyExpanded: false,
      subtitle: Text("J 101 Concorce Manhattan"),
      trailing: Icon(Icons.add),
      children: <Widget>[
        new Card(
          child: Row(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Text(
                      "Rs 200",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: 16.0,
                      onPressed: () {},
                      color: Colors.green,
                    ),
                    Text(
                      "0",
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
                    ),

                  ]),

            ],
          )
        ),
        new Card(
            child: Row(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.center_focus_strong, size: 12,),
                      Text(""),
                      Container(
                          width: c_width,
                          child:
                          Text(
                            "Roti",
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          )),
                      Text(
                        "Rs 20",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        iconSize: 16.0,
                        onPressed: () {},
                        color: Colors.green,
                      ),
                      Text(
                        "0",
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
                      ),

                    ]),

              ],
            )
        ),
        Card(
            child: Row(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.center_focus_strong, size: 12,),
                      Text(""),
                      Container(
                          width: c_width,
                          child:
                          Text(
                            "Chicken Biryani",
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          )),
                      Text(
                        "Rs 240",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        iconSize: 16.0,
                        onPressed: () {},
                        color: Colors.green,
                      ),
                      Text(
                        "0",
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
                      ),
                    ]),
              ],
            )
        )
      ],
    );
  }
}
