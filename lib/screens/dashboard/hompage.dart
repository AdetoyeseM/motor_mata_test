import 'dart:html';

import 'package:flutter/material.dart';
import 'package:new_api_task/models/newModels.dart';
import 'package:new_api_task/screens/dashboard/favourites.dart';
import 'package:new_api_task/service_locator.dart';
import 'package:new_api_task/services/blocs/news/new_bloc.dart';
import 'package:new_api_task/services/blocs/news/news_request.dart';
import 'package:new_api_task/utils/news_tile.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsBLoc newsBLoc = locator.get<NewsBLoc>();

  late List<NewsModel> favourited = [];

  @override
  Widget build(BuildContext context) {
    fetchNews(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              "News App",
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                pushToFavoriteWordsRoute(context);
              },
              child: Stack(alignment: Alignment.center, children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
                Center(
                    child: Text(
                  favourited.length.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ))
              ]),
            )
          ],
        ),
      ),
      body: StreamBuilder<List<NewsModel>>(
          stream: newsBLoc.news,
          builder: (context, AsyncSnapshot snapshot) {
            while (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              
                itemCount: 20,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var e = snapshot.data!;
                  bool isFav = favourited.contains(e[index]);
                  return NewsTile(
                    imgUrl: snapshot.data![index].urlToImage,
                    desc: e[index].description,
                    title: e[index].title,
                    content: e[index].content,
                    icon: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isFav) {
                            favourited.remove(e[index]);
                           
                          } else {
                            favourited.add(e[index]);
                            
                          }
                        });
                      },
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      ),
                    ),
                  );
                });
          }),
    );
  }
   Future pushToFavoriteWordsRoute(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FavoriteWordsRoute(
          favoriteItems: favourited,
        ),
      ),
    );
  }
}
