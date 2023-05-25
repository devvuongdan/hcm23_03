import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit() : super(NewTaskInitial());
}
