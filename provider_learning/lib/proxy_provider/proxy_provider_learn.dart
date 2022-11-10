import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/proxy_provider/proxy_models.dart';

class ProxyProviderLearnView extends StatelessWidget {
  const ProxyProviderLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Consumer<FirstModel>(
          builder: (context, provider, child) => Text(provider.value),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<FirstModel>().doSomething("Have a nice day");
            },
            child: Text("Do Something"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SecondModel>().doSomethingElse();
            },
            child: Text("Do Something Else"),
          ),
        ],
      )),
    );
  }
}
