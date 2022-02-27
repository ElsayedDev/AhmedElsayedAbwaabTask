import 'dart:convert';

import './/core/constants/interfaces/interfaces.dart';

import '../models/models.dart';
import '../network/learning_path_network.dart';

class LearningPathRepository implements RepositoryInterface<LearningPathModel> {
  /// for modeling the model

  @override
  Future<LearningPathModel?> getModel() async {
    /// get the row data form the network
    final _reponse = await LearningPathNetwork().getData();

    if (_reponse != null) {
      /// cast the row data
      final List<dynamic> _list = jsonDecode(_reponse);

      final LearningPathModel learningPathModel =
          LearningPathModel.fromList(_list);

      /// send the model
      return learningPathModel;
    } else

      /// in any case of the error
      return null;
  }
}
