import 'package:flutter/material.dart';
import 'package:new_api_task/models/newModels.dart';

class FavoriteWordsRoute extends StatelessWidget {
  final List<NewsModel>? favoriteItems;

  const FavoriteWordsRoute({Key? key, this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Favorited News'),
      ),
      body: ListView.separated(
          itemCount: favoriteItems?.length ?? 0,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return favoriteItems!.isEmpty
                ? const Text("Empty")
                : ListTile(
                    title: Text(favoriteItems![index].title.toString()),
                    subtitle: Text(favoriteItems![index].description.toString()),
                  );
          }),
    );
  }
}
