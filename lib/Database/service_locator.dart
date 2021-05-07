import 'package:contact_honeybee/Database/moor_database.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(AppDatabase());
}
