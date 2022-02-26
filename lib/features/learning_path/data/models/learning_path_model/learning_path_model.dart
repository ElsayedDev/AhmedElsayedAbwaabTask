import 'package:forinterview/features/learning_path/data/models/user_model/user_model.dart';

class LearningPathModel {
  final List<UserModel> users;

  const LearningPathModel(this.users);

  factory LearningPathModel.fromList(List<dynamic> list) {
    return LearningPathModel(
      List<UserModel>.from(list.map((e) => UserModel.fromMap(e))),
    );
  }
}
