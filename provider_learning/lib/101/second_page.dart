import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/101/resource_context.dart';
import 'package:provider_learning/101/students_notifier.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ResourceContext>().addNewItem("chart-" + Random().nextInt(100).toString());
            },
            child: Text("Add To chart")),
        appBar: AppBar(
          title: Text(
            context.read<ResourceContext>().studentList.length.toString(),
          ),
        ),
        body: Consumer<ResourceContext>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: context.read<ResourceContext>().studentList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.read<ResourceContext>().studentList[index].toString(),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
