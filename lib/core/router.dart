import 'package:flutter/material.dart';

import './/features/learning_path/presentaion/screens/screens.dart';

class ApplicationRouter {
  static Route? onGenralRoute(RouteSettings setting) {
    switch (setting.name) {

      /// main route and [LearningPathScreen]
      case '/':
      case LearningPathScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>

              /// go
              LearningPathScreen(),
        );
    }
  }
}
