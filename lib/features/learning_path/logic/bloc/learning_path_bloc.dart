import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:forinterview/features/learning_path/data/models/models.dart';
import 'package:forinterview/features/learning_path/data/repo/Learning_path_repository.dart';

part 'learning_path_event.dart';
part 'learning_path_state.dart';

class LearningPathBloc extends Bloc<LearningPathEvent, LearningPathState> {
  LearningPathBloc() : super(LearningPathState.initial()) {
    on<LearningPathFetched>(_onLearningPathFetched);
    on<LearningPathUserSelected>(_onLearningPathUserSelected);
  }
  Future<void> _onLearningPathFetched(
      LearningPathFetched event, Emitter<LearningPathState> emit) async {
    final LearningPathModel? _learningPathModel =
        await LearningPathRepository.getUsers();

    debugPrint(_learningPathModel.toString());
    if (_learningPathModel == null) {
      emit(LearningPathState.failed());
    } else {
      emit(LearningPathState.success(_learningPathModel));
    }
  }

  Future<void> _onLearningPathUserSelected(
      LearningPathUserSelected event, Emitter<LearningPathState> emit) async {
    emit(state.copyWith(selectedUser: event.user));
  }
}
