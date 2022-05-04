import 'package:get_it/get_it.dart';
import 'package:new_api_task/services/blocs/news/new_bloc.dart';

GetIt locator = GetIt.instance;

closeAll() async {
  await locator.reset();
}
serviceLocators() {
  locator.registerLazySingleton(() => NewsBLoc());
}
