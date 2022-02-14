import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi1/models/userData.dart';

import 'models/userData.dart';

class LocalJsonReader extends StatefulWidget {
  const LocalJsonReader({Key? key}) : super(key: key);

  @override
  _LocalJsonReaderState createState() => _LocalJsonReaderState();
}

class _LocalJsonReaderState extends State<LocalJsonReader> {
  List<Items>? items = [];
  // UserData? response;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String resp = await rootBundle.loadString("assets/user.json");
    // print("Resp is $resp");
    // response = jsonDecode(resp);
    UserData response = UserData.fromJson(jsonDecode(resp));
    print("Data length --> ${response}");
    setState(() {
      // items = resp.items ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(items![index].username ?? ""),
        );
      },
      itemCount: items!.length,
    ));
  }
}
