import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/request_resource/viewmodel/request_resource_provider.dart';

import '../model/resource_model.dart';

class RequestResourceView extends StatelessWidget {
  const RequestResourceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => RequestResourceProvider()),
      builder: (context, child) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildListView(context, context.watch<RequestResourceProvider>().resource),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<Data> data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Card(
          child: Center(child: Text(data[index].name ?? "")),
        ),
      );

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: context.watch<RequestResourceProvider>().isLoading
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : SizedBox(),
    );
  }
}
