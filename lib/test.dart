import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    new MaterialApp(
      title: 'Fetch Data',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        infos = value;
      });
    });
  }

  var infos;
  getData() async {
    var myUrl = Uri.parse("https://api.jsonbin.io/b/5e1219328d761771cc8b9394") ;
    var req = await http.get(myUrl);
    infos = json.decode(req.body);
    print(infos['name']);
    return infos['name'];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('hello'),
        backgroundColor: Colors.amber,
      ),
      body: new Center(
        child: infos == null ? new Text('test') : Text(infos),
      ),
    );
  }
}