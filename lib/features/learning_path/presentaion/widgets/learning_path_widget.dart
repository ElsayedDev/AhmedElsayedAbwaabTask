import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../logic/bloc/learning_path_bloc.dart';

import './/packages/map_path/map_path.dart';
import 'learning_path_card_widget.dart';

class LearningPathWidget extends StatelessWidget {
  const LearningPathWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _learningUsesrPathProvider =
        context.read<LearningPathBloc>().state.learningPathModel!.users;

    return Stack(
      children: _learningUsesrPathProvider
          .map(
            (user) => MapPathCard(
              index: _learningUsesrPathProvider.indexOf(user),
              length: _learningUsesrPathProvider.length,
              child: LearningPathCardWidget(user: user),
              connectorType: ConnectorType.dashed,
            ).render(context),
          )
          .toList(),
    );
  }
}
