import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forinterview/features/learning_path/logic/bloc/learning_path_bloc.dart';
import 'package:forinterview/features/learning_path/presentaion/widgets/learning_path_widget.dart';

import 'failed_screen.dart';
import 'waiting_screen.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({Key? key}) : super(key: key);
  static const String routeName = '/learning_path';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningPathBloc, LearningPathState>(
      builder: (context, state) {
        switch (state.learningPathSatus) {
          case LearningPathSatus.initial:
            return const WaitingScreen();

          case LearningPathSatus.failed:
            return const FailedScreen();

          case LearningPathSatus.success:
            return const LearningPathBody();
        }
      },
    );
  }
}

class LearningPathBody extends StatelessWidget {
  const LearningPathBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _height = _size.height * 0.6 * 1.5;

    final _width = _size.width * 0.8 * 1.3;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: _height,
            width: _width,
            child: const SingleChildScrollView(child: LearningPathWidget()),
          ),
        ),
      ),
    );
  }
}
