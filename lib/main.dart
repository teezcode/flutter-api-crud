import 'package:api_crud/details.dart';
import 'package:api_crud/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_item.dart';

void main() {
  runApp(ApiCrud());
}


class ApiCrud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Profiler',
        // theme: appThemeLight,
        // routes: RouteNames.routes,
        // initialRoute: RouteNames.splashScreen,
        home: Details(),
      ),
    );
  }
}

