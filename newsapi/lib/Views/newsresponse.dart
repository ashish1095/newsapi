import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi1/models/newsmodel.dart';

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<Articles> articles = [];
  callApi() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2021-09-12&to=2021-09-12&sortBy=popularity&apiKey=0a1ef010299444baa447b581232bf96c"));
    print("Resp --> ${response.body}");
    NewsResponse resp = NewsResponse.fromJson(jsonDecode(response.body));
    print("Data length --> ${resp.articles?.length}");
    setState(() {
      articles = resp.articles ?? [];
    });
  }

  @override
  void initState() {
    super.initState();

    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(articles[index].title ?? ""),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: articles.length),
    );
  }
}
