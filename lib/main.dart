import 'package:flutter/material.dart';
import 'package:mvvm_flutter/semester/viewmodel/semesterviewmodel.dart';
import 'package:mvvm_flutter/semester/views/semesterview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SemesterViewModel()),
        ],
        child: MaterialApp(
          title: 'MVVM Flutter',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: const SemesterView(),
        ));
  }
}
