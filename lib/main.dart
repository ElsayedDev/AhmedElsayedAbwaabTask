import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forinterview/core/theme/custom_themes.dart';
import 'package:forinterview/features/learning_path/data/repo/Learning_path_repository.dart';
import 'package:forinterview/features/learning_path/presentaion/screens/learning_path_screen.dart';

import 'features/learning_path/logic/bloc/learning_path_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LearningPathRepository(),
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningPathBloc()..add(LearningPathFetched()),
      child: MaterialApp(
        title: 'Learning Path',
        theme: CustomThemes.themeData,
        home: const LearningPathScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
