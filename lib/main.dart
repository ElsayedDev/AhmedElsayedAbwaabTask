import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// settings
import './/core/theme/custom_themes.dart';
import './/core/router.dart';

/// repositories
import './/core/repositories.dart';
import 'core/blocs.dart';

///
/// if we will use test should set here
///
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// set all the repositories here
    return RepositoryProvider(
      /// for  [LearningPath feature]

      create: (context) => LearningPathRepository(),

      /// go to AppView
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
    /// set tha application settings
    return BlocProvider(
      create: (context) =>
          LearningPathBloc(context.read<LearningPathRepository>())
            ..add(LearningPathFetched()),
      child: MaterialApp(
        title: 'Learning Path',

        /// to push route with name
        ///
        /// also included the inst. of each bloc screen
        ///
        onGenerateRoute: ApplicationRouter.onGenralRoute,

        /// whole application thems
        theme: CustomThemes.themeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
