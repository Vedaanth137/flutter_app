import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/profile.dart';

import 'landing.dart';

class SideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[Colors.grey,Colors.white])),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Row(
                    children: <Widget>[
                      CircleAvatar(
                         radius: 50,
                        child: ClipOval(
                            child: Image.asset('images/person.png'),
                        ),
                      ),
                      new Padding(padding: EdgeInsets.all(8), child: Text("Vedaanth Pradhan",style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Raleway', )),)
                    ],
                  ),
              ),
            ),
            ListTile(
              title: Text("Home",style: TextStyle(fontSize: 23, color: Colors.black,fontFamily: 'Raleway', )),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_right),
              //onTap: ()=> {Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()))}
            ),
            ListTile(
              title: Text("Profile",style: TextStyle(fontSize: 23, color: Colors.black,fontFamily: 'Raleway', ),),
              leading: Icon(Icons.person_outline),
              trailing: Icon(Icons.arrow_right),
              onTap: ()=> {Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()))}
            ),
            ListTile(
              title: Text("History",style: TextStyle(fontSize: 23, color: Colors.black,fontFamily: 'Raleway', )),
              leading: Icon(Icons.history),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("Logout",style: TextStyle(fontSize: 23, color: Colors.black,fontFamily: 'Raleway', )),
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.arrow_right),
              onTap: ()=> Navigator.popAndPushNamed(context, '/welcome'),
            ),
          ],
        ),
      )
    );
  }
}