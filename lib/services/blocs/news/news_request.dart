import 'package:flutter/cupertino.dart';
import 'package:new_api_task/models/newModels.dart';
import 'package:new_api_task/services/apis/constants/constants.dart';
import 'package:new_api_task/services/blocs/news/new_bloc.dart';

import '../../../service_locator.dart';
import '../../apis/api_fetch.dart';

fetchNews(BuildContext? context) async {
  var url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY";
  var usnews = await get(url: url, context: context);
  NewsBLoc newsBLoc = locator.get<NewsBLoc>();
  List<NewsModel> mnews = usnews['data']['articles']
      .map<NewsModel>((news) => NewsModel.fromJson(news))
      .toList();
  newsBLoc.addBanks(mnews);
}
