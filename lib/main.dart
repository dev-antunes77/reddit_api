import 'package:api_mock/app/app.dart';
import 'package:api_mock/data/hive_post_item_databae/hive_post_item_database.dart';
import 'package:api_mock/data/hive_post_item_databae/hive_post_item_model.dart';
import 'package:api_mock/data/post_item_database.dart';
import 'package:api_mock/http_service/http_service.dart';
import 'package:api_mock/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final notificationService = LocalNotificationService();
  final postItemDatabase = await _configPostItemDatabase();
  final apiService = HttpConnection();
  final postRepository = ApiRepository(apiService, postItemDatabase);

  runApp(
    App(
      postRepository: postRepository,
      // notificationService: notificationService,
    ),
  );
}

Future<PostItemDatabase> _configPostItemDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostItemHiveAdapter());
  return HivePostItemDatabase();
}
