import 'package:new_api_task/models/newModels.dart';
import 'package:rxdart/rxdart.dart'; 
class NewsBLoc{

  final _news = BehaviorSubject<List<NewsModel>>();

  Stream<List<NewsModel>> get news => _news.stream;

  addBanks(List<NewsModel> e) => _news.add(e);

  dispose()
  {
    _news.close();
  }
}