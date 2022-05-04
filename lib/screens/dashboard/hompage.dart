import 'dart:html';

import 'package:flutter/material.dart';
import 'package:new_api_task/models/newModels.dart';
import 'package:new_api_task/service_locator.dart';
import 'package:new_api_task/services/blocs/news/new_bloc.dart';
import 'package:new_api_task/services/blocs/news/news_request.dart';
import 'package:new_api_task/utils/news_tile.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NewsBLoc newsBLoc = locator.get<NewsBLoc>();

  @override
  Widget build(BuildContext context) {
    // fetchNews(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<List<NewsModel>>(
          stream: newsBLoc.news,
          builder: (context, AsyncSnapshot snapshot) {
            while (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var e = snapshot.data!;
                  return NewsTile(
                    imgUrl: snapshot.data![index].urlToImage,
                    desc: e[index].description,
                    title: e[index].title,
                    content: e[index].content,
                  );
                });
          }),
    );
  }
}
