import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/101/resource_context.dart';
import 'package:provider_learning/101/second_page.dart';

import 'students_notifier.dart';

class StudentsHome extends StatelessWidget {
  const StudentsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentsNotifier>(
      create: (context) => StudentsNotifier(),
      builder: (context, child) => Scaffold(
        appBar: _buildAppBar(context),
        floatingActionButton: _buildAddFloatingActionButton(context),
        body: _buildListView(context),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Text("Save"),
      onPressed: () {
        //context.read<StudentsNotifier>().studentsList = ["Oğuzhan", "Ozer", "Co", "Bozo", "Bozok"];
        saveData(context);

        ///context.read<StudentsNotifier>().changeIsLoading();
        ///context.read<StudentsNotifier>().addStudent("oguzhan-" + Random().nextInt(100).toString());
      },
    );
  }

  void saveData(BuildContext context) {
    context.read<StudentsNotifier>().savedList(context.read<ResourceContext>());
    Navigator.push(context, MaterialPageRoute(builder: ((context) => Secondpage())));
  }

  FloatingActionButton _buildAddFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Text("Add"),
      onPressed: () {
        context.read<StudentsNotifier>().addStudent("oguzhan-" + Random().nextInt(100).toString());
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                saveData(context);
              },
              icon: Icon(Icons.save))
        ],
        title: Selector<StudentsNotifier, bool>(
            selector: (context, view) {
              return view.isLoading;
            },
            builder: ((context, value, child) => value
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const SizedBox())),
      );

  Widget _buildListView(BuildContext context) {
    return Consumer<StudentsNotifier>(
      builder: ((context, value, child) => ListView.builder(
            itemCount: value.studentsList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value.studentsList[index].toString(),
                  ),
                ),
              );
            },
          )),
    );
  }
}
