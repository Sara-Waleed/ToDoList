import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Domain/models/Task_Model.dart';

part 'task_state.dart';

class NoteCubit extends Cubit<List<Task>> {
  NoteCubit() : super([]);

  void addNote({
    required String content,
    required DateTime date,
    required String priority,

  }) {
    List<Task> updatedNotes = List.from(state);
    updatedNotes.add(Task(
      content: content,
      date: date,
      priority: priority,
    ));
    emit(updatedNotes);
  }
}