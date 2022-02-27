import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forinterview/features/learning_path/data/models/models.dart';
import 'package:forinterview/features/learning_path/logic/bloc/learning_path_bloc.dart';
import 'package:provider/src/provider.dart';

import 'dialog_profile_widget.dart';

class LearningPathCardWidget extends StatelessWidget {
  final UserModel user;

  const LearningPathCardWidget({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    onCardButtonPressed() async {
      /// to generate the random numbers
      final Random _random = Random();

      /// choose random GIFs
      final String _randomURL = 'assets/loading${_random.nextInt(7) + 1}.gif';

      /// random colors
      final Color _randomColor =
          Colors.primaries[_random.nextInt(Colors.primaries.length)];
      /* 
      
      
       */

      /// push an event with the selected user
      ///                             => instead of pass the user throw widgets
      ///
      await context.read<LearningPathBloc>()
        ..add(LearningPathUserSelected(user));

      /// then please show the dialog
      showDialog(
        context: context,
        builder: (context) =>

            /// go to LearningProfileProfileCardDialog
            LearningProfileProfileCardDialog(
                    gifURL: _randomURL, color: _randomColor)
                .render(context),
      );
    }

    /// show the Text (center widget)
    return TextButton(
      child: Center(
        child: Text(
          user.name ?? '',
          style: const TextStyle(color: Colors.orange),
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.orange.shade50),
      ),
      onPressed: onCardButtonPressed,
    );
  }
}
