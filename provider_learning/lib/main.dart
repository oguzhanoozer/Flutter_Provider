import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/proxy_provider/proxy_models.dart';
import 'package:provider_learning/request_resource/view/request_resource_view.dart';

import '101/basic_101.dart';
import '101/resource_context.dart';
import 'proxy_provider/proxy_provider_learn.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResourceContext()),
        ChangeNotifierProvider<FirstModel>(create: (context) => FirstModel()),
        ProxyProvider<FirstModel, SecondModel>(
          update: (context, value, previous) => SecondModel(value),
        )
      ],
      builder: (context, child) => const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: RequestResourceView(),
    );
  }
}
