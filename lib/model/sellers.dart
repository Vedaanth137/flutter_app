import 'package:flutter/material.dart';

class Sellers extends StatelessWidget {
  final int id;
  final String name;
  final double rating;
  final String thumbnail;
  final String shortnote;
  final int deliverytime;
  final int costfortwo;

  Sellers(
      {this.id,
        this.name,
        this.rating,
        this.thumbnail,
        this.shortnote,
        this.deliverytime,
        this.costfortwo});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/restaurent');
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Image.network(
                    this.thumbnail,
                    scale: 1.0,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          shortnote,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Divider(),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "★ $rating",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "$deliverytime mins",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "₹ $costfortwo for two",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
