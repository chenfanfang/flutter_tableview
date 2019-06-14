//flutter
import 'package:flutter/material.dart';
//tool
import 'demo_tool/route_tool.dart';
//page
import 'demo_page/simple_demo_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterTableView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                push(context, SimpleDemoPage());
              },
              child: Text('simple demo'),
            ),
            FlatButton(

              onPressed: () {
                print('wrap refresh demo');

              },
              child: Text('wrap refresh demo'),
            ),
          ],
        ),
      ),
    );
  }
}
