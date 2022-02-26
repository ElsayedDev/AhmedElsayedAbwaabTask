part of 'learning_path_bloc.dart';

@immutable
abstract class LearningPathEvent {}

class LearningPathFetched extends LearningPathEvent {}

class LearningPathUserSelected extends LearningPathEvent {
  final UserModel user;

  LearningPathUserSelected(this.user);
}
