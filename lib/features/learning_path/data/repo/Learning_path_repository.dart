import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:forinterview/features/learning_path/data/models/models.dart';
import 'package:forinterview/features/learning_path/data/network/learning_path_network.dart';

class LearningPathRepository {
  static Future<LearningPathModel?> getUsers() async {
    final _reponse = await LearningPathNetwork.getUsersData();

    if (_reponse != null) {
      final List<dynamic> _list = jsonDecode(_reponse);
      final LearningPathModel learningPathModel =
          LearningPathModel.fromList(_list);

      return learningPathModel;
    } else
      return null;
  }
}
