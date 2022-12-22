// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/semester/viewmodel/semesterviewmodel.dart';
import 'package:provider/provider.dart';

class SemesterView extends StatelessWidget {
  const SemesterView({super.key});

  @override
  Widget build(BuildContext context) {
    SemesterViewModel semesterViewModel = context.watch<SemesterViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Flutter"),
      ),
      body: SizedBox(
        height: 1200,
        width: double.infinity,
        child: semesterListWidget(obj: semesterViewModel),
      ),
    );
  }

  Widget semesterListWidget({SemesterViewModel? obj}) {
    if (obj!.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }
    if (obj.userError.isError == true) {
      log(obj.loading.toString());
      log(obj.userError.message);
      return AlertDialog(
        title: const Text("MVVM Flutter"),
        content: Text(
          obj.userError.message.toString(),
          style: const TextStyle(
              color: Colors.red, fontSize: 28, fontWeight: FontWeight.w900),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(obj.semesterListModel[index].thumbnailUrl),
              const SizedBox(
                height: 15,
              ),
              Text(
                obj.semesterListModel[index].title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        );
      },
      itemCount: obj.semesterListModel.length,
    );
  }
}
