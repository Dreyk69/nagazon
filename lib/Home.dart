import 'package:flutter/material.dart';
import 'package:iksperement/MyApp.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
               Tab(text: ('FACECONTROL'),),
                Tab(text: ('ФИШКИ'),),
            ],
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
            unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
          ),
          title: Align (
            child: Text("NAGASONE",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal )
            ),
            alignment: Alignment.center
          ),
          elevation: 0.0,
          actions: <Widget>[Icon(Icons.more_vert)]
        ),
        body: TabBarView(
          children: [
             Center(child: MyApp()),
             Center(child: Text("Transit")),
          ],
        ),
      ),
    );
  }
}