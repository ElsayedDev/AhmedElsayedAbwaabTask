part of 'learning_path_bloc.dart';

enum LearningPathSatus { initial, failed, success }

class LearningPathState extends Equatable {
  final LearningPathModel? learningPathModel;
  final LearningPathSatus learningPathSatus;
  final UserModel? selectedUser;

  const LearningPathState._({
    this.learningPathSatus = LearningPathSatus.initial,
    this.learningPathModel,
    this.selectedUser,
  });

  const LearningPathState.initial() : this._();

  const LearningPathState.success(LearningPathModel learningPathModel)
      : this._(
          learningPathModel: learningPathModel,
          learningPathSatus: LearningPathSatus.success,
        );

  const LearningPathState.failed()
      : this._(learningPathSatus: LearningPathSatus.failed);

  LearningPathState copyWith({
    LearningPathModel? learningPathModel,
    LearningPathSatus? learningPathSatus,
    UserModel? selectedUser,
  }) {
    return LearningPathState._(
      learningPathModel: learningPathModel ?? this.learningPathModel,
      learningPathSatus: learningPathSatus ?? this.learningPathSatus,
      selectedUser: selectedUser ?? this.selectedUser,
    );
  }

  @override
  List<Object?> get props =>
      [learningPathSatus, selectedUser, learningPathModel];
}
