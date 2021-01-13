import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/stores/page_store.dart';

import 'screens/base/base_scren.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParse() async {
  return await Parse().initialize("QeEZlFunEp76lOJCk7L9K4pCrAQsLf8J5jIeePDO",
      "https://parseapi.back4app.com/",
      clientKey: "EU4n0t7JzyqDdEH4t71c3lQhQpDYTLF1dHOdtBM9",
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
          appBarTheme: AppBarTheme(elevation: 0),
          scaffoldBackgroundColor: Colors.purple,
          primaryColor: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.orange,
          )),
      home: BaseScreen(),
    );
  }
}
