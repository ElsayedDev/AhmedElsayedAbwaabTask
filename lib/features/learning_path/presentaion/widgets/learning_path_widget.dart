import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forinterview/features/learning_path/data/models/user_model/user_model.dart';
import 'package:forinterview/features/learning_path/logic/bloc/learning_path_bloc.dart';
import 'package:forinterview/packages/flow_path.dart';
import 'package:provider/src/provider.dart';

import 'dialog_profile_widget.dart';

class LearningPathWidget extends StatelessWidget {
  const LearningPathWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _learningUsesrPathProvider =
        context.read<LearningPathBloc>().state.learningPathModel!.users;
    return Stack(
      children: _learningUsesrPathProvider
          .map(
            (user) => LearningPathTileWidget(
              index: _learningUsesrPathProvider.indexOf(user),
              length: _learningUsesrPathProvider.length,
              child: CardWidget(
                user: user,
              ),
            ).render(context),
          )
          .toList(),
    );
  }
}

class CardWidget extends StatelessWidget {
  final UserModel user;

  const CardWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random _random = Random();
    return TextButton(
      child: Center(
        child: Text(
          user.name ?? '',
          style: const TextStyle(color: Colors.orange),
        ),
      ),
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.orange.shade50)),
      onPressed: () async {
        final String _randomURL = 'assets/loading${_random.nextInt(7) + 1}.gif';
        final Color _randomColor =
            Colors.primaries[_random.nextInt(Colors.primaries.length)];

        await context.read<LearningPathBloc>()
          ..add(LearningPathUserSelected(user));

        showDialog(
          context: context,
          builder: (context) =>
              DialogProfile(gifURL: _randomURL, color: _randomColor)
                  .render(context),
        );
      },
    );
  }
}

class LearningPathTileWidget extends FlowCard {
  LearningPathTileWidget(
      {required int index, required Widget child, required int length})
      : super(
          child: child,
          index: index,
          length: length,
          connectorType: ConnectorType.solid,
        );
}
